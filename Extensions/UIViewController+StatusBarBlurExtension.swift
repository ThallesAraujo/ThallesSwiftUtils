//
//  UIViewController.swift
//  ThallesBrowser
//
//  Created by Thalles Araújo on 02/10/20.
//

import Foundation
import UIKit

extension UIViewController{
    
    func addBlurredStatusBar() {
        let bounds = self.navigationController?.navigationBar.bounds
        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        visualEffectView.frame = bounds ?? CGRect.zero
        visualEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.navigationController?.navigationBar.sendSubviewToBack(visualEffectView)

        // Here you can add visual effects to any UIView control.
        // Replace custom view with navigation bar in the above code to add effects to the custom view.
    }
    
}
