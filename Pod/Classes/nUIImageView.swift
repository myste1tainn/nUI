//
//  nUIImageView.swift
//  Pods
//
//  Created by A. Keereena on 3/4/16.
//
//

import UIKit

@IBDesignable
public class nUIImageView: UIImageView {

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
    
    public func setImageWithURL(url: NSURL, doCache cache: Bool = true) {
        let imageCache = nUIImageCache.defaultCache()
        if let image = imageCache.imageForURL(url) {
            self.image = image
        } else {
            let mainQueue = NSOperationQueue.mainQueue()
            
            self.showActivityIndicator()
            
            NSURLSession
                .sharedSession()
                .dataTaskWithURL(
                    url,
                    completionHandler: { (data, _, error) -> Void in
                        let setImageblock = NSBlockOperation { () -> Void in
                            
                            // Whether setting image success/fails remove the activity indicator
                            defer {
                                self.hideActivityIndicator()
                            }
                            
                            // Parse data to image with guard
                            guard
                                let data = data where error == nil,
                                let image = UIImage(data: data)
                                else { return }
                            
                            // Set the downloaded image
                            self.image = image
                            
                            // Do cache, if needed
                            if cache {
                                imageCache.cacheImage(image, withURL: url)
                            }
                        }
                        mainQueue.addOperation(setImageblock)
                    }
                ).resume()
        }
    }

}
