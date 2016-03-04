//
//  nUIImageCache.swift
//  Pods
//
//  Created by A. Keereena on 3/4/16.
//
//

import UIKit

public class nUIImageCache: NSObject {
    
    var cache = NSCache()
    
    private static var DEFAULT_CACHE = nUIImageCache()
    public class func defaultCache() -> nUIImageCache {
        return nUIImageCache.DEFAULT_CACHE
    }
    
    public class func imageForURL(url: NSURL) -> UIImage? {
        return nUIImageCache.defaultCache().imageForURL(url)
    }
    
    public func imageForURL(url: NSURL) -> UIImage? {
        return cache.objectForKey(url) as? UIImage
    }
    
    public class func cacheImage(image: UIImage, withURL url: NSURL) {
        nUIImageCache.defaultCache().cacheImage(image, withURL: url)
    }
    
    public func cacheImage(image: UIImage, withURL url: NSURL) {
        cache.setObject(image, forKey: url)
    }
    
    
}

