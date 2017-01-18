//
//  Math.swift
//  Pods
//
//  Created by A. Keereena on 3/4/16.
//
//

import UIKit

open class Math<T: Comparable>: NSObject {

    open class func smallerOneA(_ A: T, orB B: T) -> T {
        return (A > B) ? B : A
    }
    open class func biggerOneA(_ A: T, orB B: T) -> T {
        return (A > B) ? A : B
    }
    
}
