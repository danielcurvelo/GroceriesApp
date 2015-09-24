//
//  CartViewController.swift
//  GroceriesApp
//
//  Created by Robert Shepperd on 9/17/15.
//  Copyright © 2015 DanielCurvelo. All rights reserved.
//

import UIKit

class CartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerNib(UINib.init(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: "itemCell")
        GroceryController.sharedInstance.downloadListsFromUser()
        print("list shared instance works")
    
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("itemCell", forIndexPath: indexPath) as UITableViewCell
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 66
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView.init(frame: CGRectMake(0, 0, tableView.bounds.size.width, 40))
        let headerTitle = UILabel.init(frame: CGRectMake(headerView.frame.size.width - 140, headerView.frame.size.height - 20, 130, 20))
        headerTitle.textColor = UIColor.groceryBeigeColor()
        headerView.addSubview(headerTitle)
        
        switch (section) {
        case 0:
            headerTitle.attributedText = NSAttributedString(string: "", attributes:[NSForegroundColorAttributeName:UIColor.groceryBeigeColor()])
            headerView.backgroundColor = UIColor.groceryDarkGreenColor()
         
        case 1:
            headerTitle.attributedText = NSAttributedString(string: "", attributes:[NSForegroundColorAttributeName:UIColor.groceryBeigeColor()])
            headerView.backgroundColor = UIColor.groceryDarkGreenColor()
            
        case 2:
            headerTitle.attributedText = NSAttributedString(string: "", attributes: [NSForegroundColorAttributeName:UIColor.groceryBeigeColor()])
            headerView.backgroundColor = UIColor.groceryDarkGreenColor()
            
        default:
            headerView.backgroundColor = UIColor.groceryDarkGreenColor()
        }
        
        return headerView
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return 30
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "outOfStock" {
            _ = segue.destinationViewController as! UINavigationController
    
        }
        
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
