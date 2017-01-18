//
//  MainViewController.swift
//  nUI
//
//  Created by A. Keereena on 3/4/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import nanoUI

class MainViewController: UIViewController {

    @IBOutlet weak var nview: nUIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        nview.performSelector(Selector("showActivityIndicator"), withObject: nil, afterDelay: 3)
//        nview.performSelector(Selector("hideActivityIndicator"), withObject: nil, afterDelay: 6)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
