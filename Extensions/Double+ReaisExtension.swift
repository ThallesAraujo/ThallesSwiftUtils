//
//  DoubleExtension.swift
//  empresas-ioasys
//
//  Created by Thalles Araújo on 16/02/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//
import Foundation
extension Double {
    
    public func formatCurrency() -> String {
        
        let formatter = NumberFormatter()
        
        formatter.numberStyle = NumberFormatter.Style.currency
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.currencySymbol = "R$ "
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        let currency: String
        if let floatLiteralSelf = formatter.string(from: NSNumber(floatLiteral:self)) {
            currency = floatLiteralSelf
        } else {
            currency = ""
        }
        return currency
        
    }
}
