//
//  ConfigScheme.swift
//  swift-issues
//
//  Created by Thalles Araújo on 26/01/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//


//Define environments variable per info.plist for
//all environments of the application
//Ex: info-HML.plist, info-DEV.plist, info-PRD.plist

//It allows to switch between variables using diferent bundle identifiers
//for envrironments/targets without changing the API URL in .plist
//or any other environment-sensible variable


import Foundation
class ConfigScheme{
    static var API_URL: String  {
        get {
            return ConfigScheme.valueForKey("API_URL")
        }
    }
    
    static var PLACEHOLDER_IMAGE_URL: String {
        get {
            return ConfigScheme.valueForKey("PLACEHOLDER_IMAGE_URL")
        }
    }
    
    
    
    static func valueForKey(_ key: String, plistName: String = "Info") -> String {
        if let path = Bundle.main.path(forResource: plistName, ofType: "plist") {
            if let dic = NSDictionary(contentsOfFile: path) {
                return dic[key] as? String ?? ""
            }
        }
        
        return ""
    }
    
}
