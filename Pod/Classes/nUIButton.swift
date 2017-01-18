//
//  nUIButton.swift
//  Pods
//
//  Created by A. Keereena on 3/4/16.
//
//

import UIKit

open class nUIButton: UIButton {

    open var info: NSDictionary?
    open var type: NSInteger
    
    // MARK: - Designable view manipulation
    @IBInspectable open var circle: Bool = false
    @IBInspectable open var borderRadiusAsRatio: Bool = false
    @IBInspectable open var borderColor: UIColor = UIColor.clear
    @IBInspectable open var borderWidth: CGFloat = 0.0
    @IBInspectable open var borderRadius: CGFloat = 0.0
    
    required public init(coder aDecoder: NSCoder) {
        self.type = -1
        super.init(coder: aDecoder)!
    }
    
    override public init(frame: CGRect) {
        self.type = -1
        super.init(frame: frame)
    }
    
    open override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if circle {
            let smallerOne = Math.smallerOneA(frame.size.width, orB: frame.size.height)
            layer.cornerRadius = smallerOne / 2
            clipsToBounds = true
        }
        
        if borderRadius > 0
        {
            let cornerRadius = borderRadiusAsRatio ? frame.size.height * borderRadius : borderRadius
            layer.cornerRadius = cornerRadius
            layer.borderColor = borderColor.cgColor
            layer.borderWidth = borderWidth
            clipsToBounds = true
        }
    }

}
