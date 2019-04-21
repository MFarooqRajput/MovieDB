//
//  UIFontExtension.swift
//  MovieDB
//
//  Created by Muhammad Farooq on 21/04/2019.
//  Copyright © 2019 Muhammad Farooq. All rights reserved.
//

import Foundation

import UIKit
extension UIFont {
    
    //All fonts
    class func printFontNames() {
        familyNames.sorted().forEach{ familyName in
            print("*** \(familyName) ***")
            fontNames(forFamilyName: familyName).forEach { fontName in
                print("\(fontName)")
            }
            print("---------------------")
        }
        print(".........")
    }
    
    //Lobster1.3
    class func PGLobster(ofSize: CGFloat) -> UIFont {
        if let customFont = UIFont(name: "Lobster1.3", size: ofSize) {
            return customFont
        } else {
            return UIFont.systemFont(ofSize: ofSize)
        }
    }
}
