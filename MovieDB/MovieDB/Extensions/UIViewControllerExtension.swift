//
//  UIViewControllerExtension.swift
//  MovieDB
//
//  Created by Muhammad Farooq on 22/04/2019.
//  Copyright © 2019 Muhammad Farooq. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func handleErrors<Value: Codable>(response: ValueErrorTuple<Value>, onError: (() -> Void)? = nil, completion: (Value) -> Void) {
        if let value: Value = response.value {
            completion(value)
        } else {
            showAlert(message: response.error ?? "Some thing went wrong.")
        }
    }
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "MovieDB", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
}
