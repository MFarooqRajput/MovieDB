//
//  NetworkManager.swift
//  MovieDB
//
//  Created by Muhammad Farooq on 21/04/2019.
//  Copyright © 2019 Muhammad Farooq. All rights reserved.
//

import Foundation
import Alamofire
import Reachability

class NetworkManager {
    class func makeCall<Value: Codable>(url: String, param: Parameters? = nil, isOffline: Bool = false, type: Method = .get, completion: ServiceEvent<Value>?) {
        
        let fullUrlPath = "\(APIs.baseUrl)\(url)?api_key=\(Constants.API_KEY)"
        if isConnected() {
            
            let decoder = JSONDecoder()
            sessionManager.request(fullUrlPath, method: type.getAlamofireMethod(), parameters: param, encoding: (type == .get) ? URLEncoding.default : JSONEncoding.default, headers: nil).responseDecodableObject(keyPath: nil, decoder: decoder) { (response: DataResponse<Value>) in
                
                switch response.result {
                case .success(let value):
                    if isOffline {
                        UserDefaultsHelper.set(key: fullUrlPath, value: value)
                    }
                    completion?((value, nil))
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                    completion?((nil, error.localizedDescription))
                }
            }
            
        } else {
            if let value: Value = UserDefaultsHelper.get(key: fullUrlPath), isOffline {
                completion?((value, nil))
            } else {
                print("Error: No Internet.")
                completion?((nil, "Sorry! your internet connection is not working properly."))
            }
        }
    }
    
    class public func isConnected() -> Bool {
        let reachibility = Reachability()
        let networkStatus = reachibility?.connection
        
        return networkStatus != .none
    }
    
    static let sessionManager: SessionManager = {
        let serverTrustPolicies: [String: ServerTrustPolicy] = [
            APIs.baseUrl: .disableEvaluation
        ]
        
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        
        let manager = Alamofire.SessionManager(configuration: configuration,
                                               serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies))
        manager.session.configuration.timeoutIntervalForRequest = 30
        manager.session.configuration.timeoutIntervalForResource = 30
        manager.delegate.sessionDidReceiveChallenge = { session, challenge in
            var disposition: URLSession.AuthChallengeDisposition = .performDefaultHandling
            var credential: URLCredential?
            
            if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust {
                disposition = URLSession.AuthChallengeDisposition.useCredential
                credential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
            } else {
                if challenge.previousFailureCount > 0 {
                    disposition = .cancelAuthenticationChallenge
                } else {
                    credential = manager.session.configuration.urlCredentialStorage?.defaultCredential(for: challenge.protectionSpace)
                    
                    if credential != nil {
                        disposition = .useCredential
                    }
                }
            }
            
            return (disposition, credential)
        }
        return manager
    }()
}
