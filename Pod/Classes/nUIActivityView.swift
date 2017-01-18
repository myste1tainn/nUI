//
//  nUIActivityView.swift
//  Pods
//
//  Created by A. Keereena on 3/4/16.
//
//

import UIKit

public protocol nUIActivityIndicator: class {
    func startAnimating()
    func stopAnimating()
}

public enum nUIActivityViewStyle: Int {
    /// Dark translucent background
    case dark
    /// White translucent background
    case light
}

open class nUIActivityViewOverlay: UIView, nUIActivityIndicator {
    
    override open var frame: CGRect {
        didSet {
            if self.subviews.count > 0 {
                self.subviews[0].frame = self.frame
            }
        }
    }
    
    open func startAnimating() {
        (self.subviews[0] as! UIActivityIndicatorView).startAnimating()
    }
    
    open func stopAnimating() {
        (self.subviews[0] as! UIActivityIndicatorView).stopAnimating()
    }
    
}

open class nUIActivityView: UIActivityIndicatorView, nUIActivityIndicator {
    
    open class func activityViewOverView(_ view: UIView, withStyle style: nUIActivityViewStyle = .dark) -> nUIActivityViewOverlay {
        let overlay = nUIActivityViewOverlay(frame: view.bounds)
        let indicator = nUIActivityView(frame: view.bounds)
        
        overlay.addSubview(indicator)
        if style == .dark {
            overlay.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
        } else {
            overlay.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)
            indicator.activityIndicatorViewStyle = .gray
        }
        
        return overlay
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
