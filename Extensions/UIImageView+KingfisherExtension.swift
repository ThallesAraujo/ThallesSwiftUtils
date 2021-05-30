//
//  UIImageViewExtension.swift
//  Bicycle Shop
//
//  Created by Thalles Araújo on 28/06/20.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView{
    
    func defineImage(address: String){
        self.kf.setImage(with: URL.init(string: address), placeholder: UIImage.init(named: "image_placeholder"), options: [.forceRefresh], progressBlock: nil, completionHandler: nil)
    }
    
}
