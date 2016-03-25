//
//  nUIButton.swift
//  Pods
//
//  Created by A. Keereena on 3/4/16.
//
//

import UIKit

public class nUIButton: UIButton {

    public var info: NSDictionary?
    public var type: Int?
    
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
