//
//  ItemDetailViewController.swift
//  GroceriesApp
//
//  Created by Robert Shepperd on 9/17/15.
//  Copyright © 2015 DanielCurvelo. All rights reserved.
//

import UIKit
import Parse

class ItemDetailViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource  {
    
    var categoriesArray = ["Produce", "Dairy", "Meat", "Condiments", "Misc", "Baby Items", "Pet Items", "Toiletries"]
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var expirationSlider: UISlider!
    @IBOutlet weak var notesTextView: UITextView!

    @IBOutlet weak var sliderLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let categoryPickerView = UIPickerView()
        
        categoryPickerView.delegate = self
        
        categoryTextField.inputView = categoryPickerView
        
        
         nameTextField.delegate = self
         categoryTextField.delegate = self
         notesTextView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoriesArray.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoriesArray[row]
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        categoryTextField.text = categoriesArray[row]
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
            notesTextView.resignFirstResponder()
            return false
        }
        return true
    }
    
    @IBAction func saveButtonTapped(sender: UIBarButtonItem) {
 
    print("Save button tapped in detail view")
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
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
