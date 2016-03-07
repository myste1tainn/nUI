//
//  Math.swift
//  Pods
//
//  Created by A. Keereena on 3/4/16.
//
//

import UIKit

public class Math<T: Comparable>: NSObject {

    public class func smallerOneA(A: T, orB B: T) -> T {
        return (A > B) ? B : A
    }
    public class func biggerOneA(A: T, orB B: T) -> T {
        return (A > B) ? A : B
    }
    
}
