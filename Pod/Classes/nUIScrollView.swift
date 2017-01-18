//
//  nUIScrollView.swift
//  Pods
//
//  Created by A. Keereena on 3/8/16.
//
//

import UIKit

open class nUIScrollView: UIScrollView {
    
    @IBInspectable open var useIntrinsicContentSize: Bool = true
    open var layoutHeightConstraint: NSLayoutConstraint?
    open var layoutWidthConstraint: NSLayoutConstraint?
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
    // Drawing code
    }
    */
    
    open override var intrinsicContentSize : CGSize {
        if useIntrinsicContentSize {
            return super.intrinsicContentSize
        } else {
            self.invalidateIntrinsicContentSize()
            self.layoutIfNeeded()
            let size = CGSize(width: UIViewNoIntrinsicMetric, height: self.contentSize.height)
            return size
        }
    }
    
}
