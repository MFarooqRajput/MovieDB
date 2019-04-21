//
//  UserDefaultsHelper.swift
//  MovieDB
//
//  Created by Muhammad Farooq on 22/04/2019.
//  Copyright © 2019 Muhammad Farooq. All rights reserved.
//

import Foundation

class UserDefaultsHelper {
    
    class func get<Value: Codable>(key: String) -> Value? {
        let decoder = JSONDecoder()
        if let data = UserDefaults.standard.data(forKey: key),
            let value = try? decoder.decode(Value.self, from: data) {
            return value
        }
        return nil
    }
    
    class func set<Value: Codable>(key: String, value: Value) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(value) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }
}
