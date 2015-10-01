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
    
    
    override func viewDidLoad() {
        tableView.registerNib(UINib.init(nibName: "FridgeTableViewCell", bundle: nil), forCellReuseIdentifier: "fridgeCell")
        super.viewDidLoad()
        
        tableView.rowHeight = 66
        
        GroceryController.sharedInstance.downloadCategories { () -> Void in
            self.tableView.reloadData()
        }
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if GroceryController.sharedInstance.categories.count > 0
        {
            let category = GroceryController.sharedInstance.categories[section]
//            category.fetchIfNeededInBackground()
            if let items = category.items {
                return items.count
                
            } else {
                
                return 0
                
            }
        } else {
            
            return 0
        }
        
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let category = GroceryController.sharedInstance.categories[section]
        return category.title
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("fridgeCell", forIndexPath: indexPath) as! FridgeTableViewCell
        let category = GroceryController.sharedInstance.categories[indexPath.section]
        let item = category.items?[indexPath.row]
            if let actualItem = item {
                print("name:\(actualItem.name)")
                if let name = actualItem.name{
                    cell.title.text = name
                }
                
                if let title = actualItem.category{
                    print("category name: \(title) and Items:\(category.items)")
                    
                    cell.category.text = title
                }
            }
            else
            {
            }

    return cell
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return GroceryController.sharedInstance.categories.count
    }
    
    @IBAction func cancelButtonTapped(sender: AnyObject) {
        
        self.navigationController?.popViewControllerAnimated(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

