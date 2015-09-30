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
    
    @IBOutlet  var emailAddressText: UITextField!
    @IBOutlet  var subjectText: UITextField!
    @IBOutlet  var reasonTextView: UITextView!
    @IBOutlet  var contactUsView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reasonTextView.delegate = self
        emailAddressText.delegate = self
        subjectText.delegate = self
        reasonTextView.delegate = self
        
        self.animator = UIDynamicAnimator.init(referenceView: self.view)
        
            let snapBehavior = UISnapBehavior.init(item: self.contactUsView, snapToPoint: self.view.center)
            snapBehavior.damping = 0.50
            self.animator?.addBehavior(snapBehavior)
        

        // Do any additional setup after loading the view.
    }
    @IBAction func userDidCancel(sender: UIBarButtonItem) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            reasonTextView.resignFirstResponder()
            return false
        }
        
        return true
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
