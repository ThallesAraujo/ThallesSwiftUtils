//
//  FormField.swift
//  empresas-ioasys
//
//  Created by Thalles Araújo on 17/02/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//
import UIKit

class FormField: UITextField {
    
    private var invalidateColor = UIColor.init(hex: "#ff0f44")
    
    @IBInspectable var fieldIcon: UIImage = UIImage.init(named: "ic_cadeado")!{
        didSet{
            self.leftViewMode = .always
            self.leftView = UIImageView.init(image: self.fieldIcon)
        }
    }
    
    var showPassword = false
    
    @IBInspectable var passwordIcon: UIImage = UIImage.init(named: "password_reveal")!{
        didSet{
            let button = UIButton.init(frame: CGRect(x: 0, y: 0, width: self.frame.height , height: self.frame.height))
            button.setImage(self.passwordIcon, for: .normal)
            button.addTarget(self, action: #selector(toggleShowPassword(_:)), for: .touchUpInside)
            self.rightViewMode = .whileEditing
            self.rightView = button
        }
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: self.frame.height/4.5, y: self.frame.height/4.5, width: self.frame.height/2 , height: self.frame.height/2)
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: self.frame.width - self.frame.height/1.5, y: self.frame.height/4.5, width: self.frame.height/2 , height: self.frame.height/2)
    }
    
    func invalidate(){
        let exclamationLabel = UILabel.init(frame: CGRect(x: self.frame.height/2, y: self.frame.height/2, width: self.frame.height/5 , height: self.frame.height/5))
        exclamationLabel.layer.cornerRadius = self.frame.height / 4
        exclamationLabel.backgroundColor = self.invalidateColor
        exclamationLabel.clipsToBounds = true
        exclamationLabel.text = "!"
        exclamationLabel.adjustsFontSizeToFitWidth = true
        exclamationLabel.textColor = UIColor.white
        exclamationLabel.textAlignment = .center
        self.rightViewMode = .unlessEditing
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 5.0
        self.layer.borderColor = self.invalidateColor.cgColor
        self.rightView = exclamationLabel
    }
    
    func validate(){
        self.rightViewMode = .never
        self.layer.borderColor = UIColor.clear.cgColor
    }
    
    @objc func toggleShowPassword(_ sender: Any){
        self.showPassword = !showPassword
        self.isSecureTextEntry = !showPassword
    }
    
    
}