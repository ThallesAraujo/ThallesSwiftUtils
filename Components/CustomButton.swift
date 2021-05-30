//
//  CustomButton.swift
//  empresas-ioasys
//
//  Created by Thalles Araújo on 17/02/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//
import UIKit

class CustomButton: UIButton {
    
    var enabledColor = UIColor.init(hex: "#57bbbc")
    var disabledColor = UIColor.init(hex: "#748383")
    
    func disable(){
        self.isEnabled = false
        let rectangle = UIView (frame :CGRect(x: 0, y: 0 , width: self.frame.width, height: self.frame.height))
        rectangle.layer.cornerRadius = 5
        rectangle.backgroundColor = self.disabledColor
        self.setBackgroundImage(rectangle.asImage(), for: .disabled)
    }
    
    func enable(){
        self.isEnabled = true
        let rectangle = UIView (frame :CGRect(x: 0, y: 0 , width: self.frame.width, height: self.frame.height))
        rectangle.layer.cornerRadius = 5
        rectangle.backgroundColor = self.enabledColor
        self.setBackgroundImage(rectangle.asImage(), for: .normal)
    }
