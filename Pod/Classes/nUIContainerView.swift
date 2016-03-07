//
//  nUIContainerView.swift
//  Pods
//
//  Created by A. Keereena on 3/7/16.
//
//

import UIKit

@IBDesignable
public class nUIContainerView: nUIView {

    @IBInspectable public var menuStoryboardName: String?
    @IBInspectable public var menuViewControllerName: String?
    @IBInspectable public var mainStoryboardName: String?
    @IBInspectable public var mainViewControllerName: String?
    
    override public func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        guard
            let menuID = menuViewControllerName where menuID != "",
            let menuSTB = menuStoryboardName where menuSTB != "",
            let mainID = mainViewControllerName where mainID != "",
            let mainSTB = mainStoryboardName where mainSTB != ""
            else
            {
                return
            }
        
        let menuViewController = viewControllerWithID(menuID, fromStoryboardName: menuSTB)
        let mainViewController = viewControllerWithID(mainID, fromStoryboardName: mainSTB)

        menuViewController.view.frame = self.frame
        mainViewController.view.frame = self.frame
        
        menuViewController.view.backgroundColor = UIColor.greenColor()
        mainViewController.view.backgroundColor = UIColor.redColor()
        
        self.addSubview(menuViewController.view)
        self.addSubview(mainViewController.view)
        
//        let views = [
//            "menuView": menuViewController.view,
//            "mainView": mainViewController.view
//        ]
//        
//        let menuMetrics: [String: AnyObject]? = nil
//        let menuConstraint = NSLayoutConstraint.constraintsWithVisualFormat(
//                "|[menuView(400)]-300-|",
//                options: .AlignAllTop,
//                metrics: menuMetrics,
//                views: views
//        )
//        menuViewController.view.addConstraints(menuConstraint)
//        
//        let mainMetrics: [String: AnyObject]? = nil
//        let mainConstraint = NSLayoutConstraint.constraintsWithVisualFormat(
//            "|-0-[mainView]-0-|",
//            options: .AlignAllTop,
//            metrics: mainMetrics,
//            views: views
//        )
//        mainViewController.view.addConstraints(mainConstraint)
    }
    
    private func viewControllerWithID(id: String, fromStoryboardName name: String) -> UIViewController {
        let stb = UIStoryboard(name: name, bundle: NSBundle.mainBundle())
        let vc = stb.instantiateViewControllerWithIdentifier(id)
        return vc
    }
}
