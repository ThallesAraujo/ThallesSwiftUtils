//
//  DateExtension.swift
//  prova-improving
//
//  Created by Thalles Araújo on 07/02/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import Foundation

extension String{
    
    func formatBr() -> String{
        let dateFormatter = DateFormatter(withFormat: "yyyy-MM-dd'T'HH:mm:ssZ", locale: "en-US")
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        return dateFormatter.string(from: date!)
    }
    
}
