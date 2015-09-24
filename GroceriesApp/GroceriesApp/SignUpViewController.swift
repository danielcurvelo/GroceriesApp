//
//  SignUpViewController.swift
//  GroceriesApp
//
//  Created by Douglas Goodwin on 9/24/15.
//  Copyright © 2015 DanielCurvelo. All rights reserved.
//

import UIKit
import Parse


class SignUpViewController: UIViewController {

    @IBOutlet weak var signUpEmailTextField: UITextField!
    @IBOutlet weak var signUpPasswordTextField: UITextField!
    @IBOutlet weak var signUpPasswordConfirmTextField: UITextField!
    @IBOutlet weak var signUpSignUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }

    @IBAction func cancelButtonTapped(sender: AnyObject) {
    
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func signUpTapped(sender: AnyObject) {
        
        if PFUser.currentUser() != nil{
            performSegueWithIdentifier("unwindToCart", sender: nil)
        }
        
//        self.dismissViewControllerAnimated(true, completion: nil)
//        print("done")
    }
    


    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
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
