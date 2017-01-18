//
//  nUIContainerView.swift
//  Pods
//
//  Created by A. Keereena on 3/7/16.
//
//

import UIKit

@IBDesignable
open class nUIContainerView: nUIView {

    @IBInspectable open var menuStoryboardName: String?
    @IBInspectable open var menuViewControllerName: String?
    @IBInspectable open var mainStoryboardName: String?
    @IBInspectable open var mainViewControllerName: String?
    
    override open func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard
            let menuID = menuViewControllerName, menuID != "",
            let menuSTB = menuStoryboardName, menuSTB != "",
            let mainID = mainViewControllerName, mainID != "",
            let mainSTB = mainStoryboardName, mainSTB != ""
            else
            {
                return
            }
        
        let menuViewController = viewControllerWithID(menuID, fromStoryboardName: menuSTB)
        let mainViewController = viewControllerWithID(mainID, fromStoryboardName: mainSTB)

        menuViewController.view.frame = self.frame
        mainViewController.view.frame = self.frame
        
        menuViewController.view.backgroundColor = UIColor.green
        mainViewController.view.backgroundColor = UIColor.red
        
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
    
    fileprivate func viewControllerWithID(_ id: String, fromStoryboardName name: String) -> UIViewController {
        let stb = UIStoryboard(name: name, bundle: Bundle.main)
        let vc = stb.instantiateViewController(withIdentifier: id)
        return vc
    }
}
