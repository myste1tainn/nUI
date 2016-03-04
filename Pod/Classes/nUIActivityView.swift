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

public class nUIActivityView: UIActivityIndicatorView, nUIActivityIndicator {
    
    public class func activityViewOverView(view: UIView, withStyle style: nUIActivityViewStyle = .Dark) -> nUIActivityView {
        let view = nUIActivityView(frame: view.bounds)
        
        if style == .Dark {
            view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
        } else {
            view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)
        }
        
        return view
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
