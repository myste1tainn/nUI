//
//  nUIScrollView.swift
//  Pods
//
//  Created by A. Keereena on 3/8/16.
//
//

import UIKit

public class nUIScrollView: UIScrollView {
    
    @IBInspectable public var useIntrinsicContentSize: Bool = true
    public var layoutHeightConstraint: NSLayoutConstraint?
    public var layoutWidthConstraint: NSLayoutConstraint?
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
    // Drawing code
    }
    */
    
    public override func intrinsicContentSize() -> CGSize {
        if useIntrinsicContentSize {
            return super.intrinsicContentSize()
        } else {
            self.invalidateIntrinsicContentSize()
            self.layoutIfNeeded()
            let size = CGSizeMake(UIViewNoIntrinsicMetric, self.contentSize.height)
            return size
        }
    }
    
}
