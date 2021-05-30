//
//  UIViewExtension.swift
//  Desafio Catho
//
//  Created by Thalles Araújo on 19/07/20.
//

import Foundation
import UIKit

extension UIView {

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    func makeCircular() {
        layer.cornerRadius = self.frame.width - 5.0
        layer.masksToBounds = true
    }
}
