//
//  LogInViewController.swift
//  GroceriesApp
//
//  Created by Douglas Goodwin on 9/24/15.
//  Copyright © 2015 DanielCurvelo. All rights reserved.
//

import UIKit
import Parse


class LogInViewController: UIViewController, UIAlertViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var loginEmailTextField: UITextField!
    @IBOutlet weak var loginPasswordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!

//    @IBAction func signUpTapped(sender: AnyObject) {
//        
//        performSegueWithIdentifier("toSignUpView", sender: LogInViewController())
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginEmailTextField.delegate = self
        loginPasswordTextField.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
    }
    
    
    @IBAction func logInTapped(sender: AnyObject) {
                
        PFUser.logInWithUsernameInBackground(self.loginEmailTextField.text!, password: self.loginPasswordTextField.text!) { (user, error) -> Void in
            
            if user != nil{
                self.dismissViewControllerAnimated(true, completion: nil)
            }
            else {
                
                let alert = UIAlertController(title: "Oops!", message: "Email and Password do not match.", preferredStyle: .Alert)
                
                
                let OKPressed = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) {
                    UIAlertAction in
                    print("OK Pressed")
                }
                
                alert.addAction(OKPressed)
                
                self.presentViewController(alert, animated: true, completion: nil)
                //Make sure to add UIAlertViewDelegate
            }
            
            
            }
            
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
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
