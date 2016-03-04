//
//  nUIImageView.swift
//  Pods
//
//  Created by A. Keereena on 3/4/16.
//
//

import UIKit

public class nUIImageView: UIImageView {

    public var activityView: nUIActivityIndicator? {
        didSet {
            if let _ = self.activityView as? UIView {
                assert(true)
            } else {
                assert(false, "Object implementing nUIAcitivityIndicator must be a subclass of UIView")
            }
        }
    }
    
    public var activityViewStyle = nUIActivityViewStyle.Dark
    
    public func showActivityIndicator() {
        if activityView == nil {
            activityView = nUIActivityView.activityViewOverView(self, withStyle: activityViewStyle)
        }
        
        self.addSubview(activityView as! UIView)
        self.activityView!.startAnimating()
    }
    
    public func hideActivityIndicator() {
        if let _ = activityView {
            (activityView as! UIView).removeFromSuperview()
        }
    }
    
    public func setImageWithURL(url: NSURL, doCache cache: Bool) {
        let imageCache = nUIImageCache.defaultCache()
        if let image = imageCache.imageForURL(url) {
            self.image = image
        } else {
            self.showActivityIndicator()
            NSURLSession
                .sharedSession()
                .dataTaskWithURL(
                    url,
                    completionHandler: { (data, _, error) -> Void in
                        defer {
                            self.hideActivityIndicator()
                        }
                        
                        guard
                            let data = data where error == nil,
                            let image = UIImage(data: data)
                            else { return }
                        dispatch_async(dispatch_get_main_queue()) { () -> Void in
                            self.image = image
                            if cache {
                                imageCache.cacheImage(image, withURL: url)
                            }
                        }
                    }
                ).resume()
        }
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
    // Drawing code
    }
    */

}
