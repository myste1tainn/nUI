//
//  nUIView.swift
//  Pods
//
//  Created by A. Keereena on 3/4/16.
//
//

import UIKit

public extension UIView {
    
    @nonobjc static let NUI_ACTIVITY_INDICATOR_ANIMATE_KEY = "NUI_ACTIVITY_INDICATOR_ANIMATE_KEY"
    @nonobjc static let NUI_ACTIVITY_INDICATOR_STYLE_KEY = "NUI_ACTIVITY_INDICATOR_STYLE_KEY"
    @nonobjc static let NUI_ACTIVITY_VIEW_TAG = -999
    
    public var activityIndicatorAnimate: Bool {
        get {
            let ud = NSUserDefaults.standardUserDefaults()
            if let obj = ud.objectForKey(UIView.NUI_ACTIVITY_INDICATOR_ANIMATE_KEY) {
                return obj.boolValue
            } else  {
                return true
            }
        }
        set {
            let ud = NSUserDefaults.standardUserDefaults()
            ud.setBool(newValue, forKey: UIView.NUI_ACTIVITY_INDICATOR_ANIMATE_KEY)
            ud.synchronize()
        }
    }
    
    public var activityViewStyle: nUIActivityViewStyle {
        get {
            let ud = NSUserDefaults.standardUserDefaults()
            let val = nUIActivityViewStyle(rawValue: ud.integerForKey(UIView.NUI_ACTIVITY_INDICATOR_STYLE_KEY))
            return val!
        }
        set {
            let ud = NSUserDefaults.standardUserDefaults()
            ud.setInteger(newValue.rawValue, forKey: UIView.NUI_ACTIVITY_INDICATOR_STYLE_KEY)
            ud.synchronize()
        }
    }
    
    public var activityView: nUIActivityIndicator? {
        get {
            return self.viewWithTag(UIView.NUI_ACTIVITY_VIEW_TAG) as? nUIActivityIndicator
        }
        set {
            if activityView != nil {
                (activityView as! UIView).removeFromSuperview()
            }
            let view = newValue as! UIView
            view.tag = UIView.NUI_ACTIVITY_VIEW_TAG
            self.addSubview(view)
        }
    }
    
    public func showActivityIndicator() {
        if self.activityView == nil {
            self.activityView = nUIActivityView.activityViewOverView(self, withStyle: self.activityViewStyle)
        }
        let view = self.activityView as? UIView
        self.bringSubviewToFront(view!)
        view!.frame = self.bounds
        view!.alpha = 0
        if self.activityIndicatorAnimate
        {
            UIView.animateWithDuration(0.3,
                animations:
                { () -> Void in
                    view!.alpha = 1
                },
                completion:
                { (completed) -> Void in
                    // Do nothing
                }
            )
        }
        self.activityView!.startAnimating()
    }
    
    public func hideActivityIndicator() {
        if let _ = activityView
        {
            if activityIndicatorAnimate
            {
                
                // Cast to view so that it can be animated
                let view = (activityView as! UIView)
                
                // Begin animation
                view.layer.opacity = 1
                UIView.animateWithDuration(0.3,
                    animations:
                    { () -> Void in
                        view.layer.opacity = 0
                    },
                    completion:
                    { (completed) -> Void in
                        view.removeFromSuperview()
                    }
                )
                
            }
            else
            {
                (activityView as! UIView).removeFromSuperview()
            }
        }
    }
}

@IBDesignable
public class nUIView: UIView {
    
    // MARK: - Designable view manipulation
    @IBInspectable public var circle: Bool = false
    @IBInspectable public var borderRadiusAsRatio: Bool = false
    @IBInspectable public var borderColor: UIColor = UIColor.clearColor()
    @IBInspectable public var borderWidth: CGFloat = 0.0
    @IBInspectable public var borderRadius: CGFloat = 0.0
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        if circle {
            let smallerOne = Math.smallerOneA(frame.size.width, orB: frame.size.height)
            layer.cornerRadius = smallerOne / 2
            clipsToBounds = true
        }
        
        if borderRadius > 0
        {
            let cornerRadius = borderRadiusAsRatio ? frame.size.height * borderRadius : borderRadius
            layer.cornerRadius = cornerRadius
            layer.borderColor = borderColor.CGColor
            layer.borderWidth = borderWidth
            clipsToBounds = true
        }
    }

}
