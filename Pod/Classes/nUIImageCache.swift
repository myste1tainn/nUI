//
//  nUIImageCache.swift
//  Pods
//
//  Created by A. Keereena on 3/4/16.
//
//

import UIKit

open class nUIImageCache: NSObject {
    
    var cache = NSCache<AnyObject, AnyObject>()
    
    fileprivate static var DEFAULT_CACHE = nUIImageCache()
    open class func defaultCache() -> nUIImageCache {
        return nUIImageCache.DEFAULT_CACHE
    }
    
    open class func imageForURL(_ url: URL) -> UIImage? {
        return nUIImageCache.defaultCache().imageForURL(url)
    }
    
    open func imageForURL(_ url: URL) -> UIImage? {
        return cache.object(forKey: url as AnyObject) as? UIImage
    }
    
    open class func cacheImage(_ image: UIImage, withURL url: URL) {
        nUIImageCache.defaultCache().cacheImage(image, withURL: url)
    }
    
    open func cacheImage(_ image: UIImage, withURL url: URL) {
        cache.setObject(image, forKey: url as AnyObject)
    }
    
    
}

