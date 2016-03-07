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
    case Dark
    /// White translucent background
    case Light
}

public class nUIActivityViewOverlay: UIView, nUIActivityIndicator {
    
    public func startAnimating() {
        (self.subviews[0] as! UIActivityIndicatorView).startAnimating()
    }
    
    public func stopAnimating() {
        (self.subviews[0] as! UIActivityIndicatorView).stopAnimating()
    }
    
}

public class nUIActivityView: UIActivityIndicatorView, nUIActivityIndicator {
    
    public class func activityViewOverView(view: UIView, withStyle style: nUIActivityViewStyle = .Dark) -> nUIActivityViewOverlay {
        let overlay = nUIActivityViewOverlay(frame: view.bounds)
        let view = nUIActivityView(frame: view.bounds)
        
        overlay.addSubview(view)
        if style == .Dark {
            overlay.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
        } else {
            overlay.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)
            view.activityIndicatorViewStyle = .Gray
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
