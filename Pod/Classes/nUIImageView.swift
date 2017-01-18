//
//  nUIImageView.swift
//  Pods
//
//  Created by A. Keereena on 3/4/16.
//
//

import UIKit

public protocol nUIImageViewDelegate {
    func imageView(_ imageView: nUIImageView, willSetImage image: UIImage)
    func imageView(_ imageView: nUIImageView, didSetImage image: UIImage)
}

@IBDesignable
open class nUIImageView: UIImageView {

    open var delegate: nUIImageViewDelegate?
    open override var image: UIImage? {
        didSet {
            guard
                let _ = delegate,
                let _ = image
                else { return }
            
            delegate?.imageView(self, didSetImage: image!)
        }
    }
    
    // MARK: - Designable view manipulation
    @IBInspectable open var circle: Bool = false
    @IBInspectable open var borderRadiusAsRatio: Bool = false
    @IBInspectable open var borderColor: UIColor = UIColor.clear
    @IBInspectable open var borderWidth: CGFloat = 0.0
    @IBInspectable open var borderRadius: CGFloat = 0.0
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override public init(frame: CGRect) {
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
    
    open func setImageWithURL(_ url: URL, doCache cache: Bool = true) {
        let imageCache = nUIImageCache.defaultCache()
        if let image = imageCache.imageForURL(url) {
            self.image = image
        } else {
            let mainQueue = OperationQueue.main
            
            self.showActivityIndicator()
            
            URLSession.shared
                .dataTask(
                    with: url,
                    completionHandler: { (data, _, error) -> Void in
                        let setImageblock = BlockOperation { () -> Void in
                            
                            // Whether setting image success/fails remove the activity indicator
                            defer {
                                self.hideActivityIndicator()
                            }
                            
                            // Parse data to image with guard
                            guard
                                let data = data, error == nil,
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
    
    /// Return height that fits the current view's width as compared to
    /// actual image width so that it fits perfectly into view
    open func heightThatFits() -> CGFloat {
        if let _ = self.image {
            let ratio = self.frame.size.width / self.image!.size.width
            let expectedViewHeight = self.image!.size.height * ratio
            return expectedViewHeight
        } else {
            return 0
        }
    }

}
