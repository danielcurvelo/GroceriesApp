//
//  FridgeViewController.swift
//  GroceriesApp
//
//  Created by Robert Shepperd on 9/17/15.
//  Copyright © 2015 DanielCurvelo. All rights reserved.
//

import UIKit

class FridgeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerNib(UINib.init(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: "itemCell")
        GroceryController.sharedInstance.downloadFridges()
        print("shared instance works")
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - DataSource
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("itemCell", forIndexPath: indexPath)
        let category = GroceryController.sharedInstance.categories
        
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 66
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 3
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    
        let headerView = UIView.init(frame: CGRectMake(0, 0, tableView.bounds.size.width, 40))
        let headerTitle = UILabel.init(frame: CGRectMake(headerView.frame.size.width - 140, headerView.frame.size.height - 20, 130, 20))
        headerTitle.textColor = UIColor.groceryBeigeColor()
        headerView.addSubview(headerTitle)
        
        switch (section) {
        case 0:
            headerTitle.attributedText = NSAttributedString(string: "EXPIRED", attributes:[NSForegroundColorAttributeName:UIColor.groceryBeigeColor()])
            headerView.backgroundColor = UIColor.groceryRedColor()
            //return sectionHeaderView
        case 1:
            headerTitle.attributedText = NSAttributedString(string: "REPLACE SOON", attributes:[NSForegroundColorAttributeName:UIColor.groceryBeigeColor()])
            headerView.backgroundColor = UIColor.groceryYellowColor()
            //return sectionHeaderView
        case 2:
            headerTitle.attributedText = NSAttributedString(string: "GOOD TO GO", attributes: [NSForegroundColorAttributeName:UIColor.groceryBeigeColor()]);
            headerView.backgroundColor = UIColor.groceryBlueColor()
            //return sectionHeaderView
        default:
            headerView.backgroundColor = UIColor.groceryBeigeColor();
        }
        
        return headerView
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return 40
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let detailItem = self.storyboard?.instantiateViewControllerWithIdentifier("itemDetail")
        self.navigationController?.pushViewController(detailItem!, animated: true)
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
