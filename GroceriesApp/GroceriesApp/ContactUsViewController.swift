//
//  ContactUsViewController.swift
//  GroceriesApp
//
//  Created by Robert Shepperd on 9/30/15.
//  Copyright © 2015 DanielCurvelo. All rights reserved.
//

import UIKit

class ContactUsViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    var animator:UIDynamicAnimator?
    
    @IBOutlet weak var emailAddressText: UITextField!
    @IBOutlet weak var subjectText: UITextField!
    @IBOutlet weak var reasonTextView: UITextView!
    @IBOutlet weak var contactUsView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.animator = UIDynamicAnimator.init(referenceView: self.view)
        
            let snapBehavior = UISnapBehavior.init(item: self.contactUsView, snapToPoint: self.view.center)
            snapBehavior.damping = 0.50
            self.animator?.addBehavior(snapBehavior)
        

        // Do any additional setup after loading the view.
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
