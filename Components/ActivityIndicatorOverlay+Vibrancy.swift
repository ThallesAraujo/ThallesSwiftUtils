import Foundation
import UIKit

import UIKit

fileprivate let overlayViewTag: Int = 999
fileprivate let activityIndicatorViewTag: Int = 1000

// Public interface
extension UIView {
    func displayAnimatedActivityIndicatorView() {
        setActivityIndicatorView()
    }

    func hideAnimatedActivityIndicatorView() {
        removeActivityIndicatorView()
    }
}

extension UIViewController {
    private var overlayContainerView: UIView {
        if let navigationView: UIView = navigationController?.view {
            return navigationView
        }
        return view
    }

    func displayAnimatedActivityIndicatorView() {
        overlayContainerView.displayAnimatedActivityIndicatorView()
    }

    func hideAnimatedActivityIndicatorView() {
        overlayContainerView.hideAnimatedActivityIndicatorView()
    }
}

// Private interface
extension UIView {
    private var loaderView: UIActivityIndicatorView {
        let view: UIActivityIndicatorView = UIActivityIndicatorView(style: .large)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tag = activityIndicatorViewTag
        view.color = UIColor.init(named: "Marigold")
        return view
    }

    private var overlayView: UIView {
        let view: UIView = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        
        view.tag = overlayViewTag
        
        let blurEffect = UIBlurEffect(style: .systemThinMaterial)
    
        
        let blurView = UIVisualEffectView(effect: blurEffect)
        
        blurView.translatesAutoresizingMaskIntoConstraints = false
        blurView.clipsToBounds = true
        view.insertSubview(blurView, at: 0)

        //Determina as constraints na view
        blurView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        blurView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        blurView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        blurView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        blurView.layer.cornerRadius = 5
        
        
        
        return view
    }

    private func setActivityIndicatorView() {
        guard !isDisplayingActivityIndicatorOverlay() else { return }
        let overlayView: UIView = self.overlayView
        let loaderView: UIActivityIndicatorView = self.loaderView

        //add subviews
        overlayView.addSubview(loaderView)
        addSubview(overlayView)

        //add overlay constraints
        overlayView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2).isActive = true
        overlayView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        overlayView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        overlayView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        //overlay radius
        overlayView.layer.cornerRadius = 5

        //add indicator constraints
        loaderView.centerXAnchor.constraint(equalTo: overlayView.centerXAnchor).isActive = true
        loaderView.centerYAnchor.constraint(equalTo: overlayView.centerYAnchor).isActive = true

        //animate indicator
        loaderView.startAnimating()
    }

    private func removeActivityIndicatorView() {
        guard let overlayView: UIView = getOverlayView(), let activityIndicator: UIActivityIndicatorView = getActivityIndicatorView() else {
            return
        }
        UIView.animate(withDuration: 0.2, animations: {
            overlayView.alpha = 0.0
            activityIndicator.stopAnimating()
        }) { _ in
            activityIndicator.removeFromSuperview()
            overlayView.removeFromSuperview()
        }
    }

    private func isDisplayingActivityIndicatorOverlay() -> Bool {
        getActivityIndicatorView() != nil && getOverlayView() != nil
    }

    private func getActivityIndicatorView() -> UIActivityIndicatorView? {
        viewWithTag(activityIndicatorViewTag) as? UIActivityIndicatorView
    }

    private func getOverlayView() -> UIView? {
        viewWithTag(overlayViewTag)
    }
}
