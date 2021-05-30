//
//  UIColorExtension.swift
//  code hero
//
//  Created by Thalles Araújo on 13/02/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import Foundation
import UIKit

extension UIColor{
    
    convenience init(hex: String?) {
        if hex != nil {
            var cString:String = hex!.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
            
            if (cString.hasPrefix("#")) {
                cString.remove(at: cString.startIndex)
            }
            
            if (cString.characters.count != 6) {
                self.init(white: 1.0, alpha: 1.0)
            } else {
                var rgbValue: UInt32 = 0
                Scanner(string: cString).scanHexInt32(&rgbValue)
                
                self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                          green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                          blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                          alpha: CGFloat(1.0))
            }
        } else {
            
            self.init(red: 255.0, green: 255.0, blue: 255.0, alpha: CGFloat(1.0))
        }
    }
    
}
