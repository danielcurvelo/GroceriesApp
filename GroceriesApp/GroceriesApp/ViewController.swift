//
//  ViewController.swift
//  GroceriesApp
//
//  Created by Mac User on 9/13/15.
//  Copyright (c) 2015 DanielCurvelo. All rights reserved.
//
import Parse
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if GroceryController.sharedInstance.categories.count > 0
        {
            let category = GroceryController.sharedInstance.categories[section]
            if let items = category.items {
                return items.count
                
            } else {
                return 0
                
            }
        } else {
            
            return 0
        }
        
    }
    
    func tableView(numberOfSectionsInTableView:UITableView) -> Int {
        return GroceryController.sharedInstance.categories.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("createItemCell", forIndexPath: indexPath) as! ItemTableViewCell
        let category = GroceryController.sharedInstance.categories[indexPath.section]
        let item = category.items?[indexPath.row]
        if let actualItem = item {
            cell.title.text = actualItem.name
            cell.category.text = actualItem.category?.title
            
        }
        return cell
    }
    
    
    @IBAction func cancelButtonTapped(sender: AnyObject) {
        
        self.navigationController?.popViewControllerAnimated(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

