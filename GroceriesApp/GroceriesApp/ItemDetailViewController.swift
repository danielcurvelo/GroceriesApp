//
//  ItemDetailViewController.swift
//  GroceriesApp
//
//  Created by Robert Shepperd on 9/17/15.
//  Copyright © 2015 DanielCurvelo. All rights reserved.
//

import UIKit
import Parse

class ItemDetailViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate  {
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailItemNameTextField: UITextField!
    @IBOutlet weak var detailItemCategoryTextField: UITextField!
    @IBOutlet weak var detailItemExpirationSlider: UISlider!
    @IBOutlet weak var detailItemNotesTextView: UITextView!

    @IBOutlet weak var sliderLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
       
         detailItemNameTextField.delegate = self
         detailItemCategoryTextField.delegate = self
         detailItemNotesTextView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        
        let currentValue = Int(sender.value)
        sliderLabel.text = "\(currentValue)"
        
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let detailItem = self.storyboard?.instantiateViewControllerWithIdentifier("itemDetail")
        self.navigationController?.pushViewController(detailItem!, animated: true)
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            detailItemNotesTextView.resignFirstResponder()
            return false
        }
        return true
    }
    
    @IBAction func saveButtonTapped(sender: UIBarButtonItem) {
        
    var item = PFObject.init(className: "Item")
    
        
        
    print("Save button tapped in detail view")
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
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
