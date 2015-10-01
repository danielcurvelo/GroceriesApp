//
//  GroceryController.swift
//  GroceriesApp
//
//  Created by Mac User on 9/15/15.
//  Copyright (c) 2015 DanielCurvelo. All rights reserved.
//

import UIKit
import Foundation
import Parse


class GroceryController: NSObject {
    
    static let sharedInstance = GroceryController()
    
    override init() {
        super.init()
//      self.uploadCategories { (category) -> Void in
//
//        }
    }
    
    var fridge: Fridge?
    var categories:[Category] = []
    
    func createItemInCategory(category: Category, name: String?) {
        
        let item = Item()
        item.category = category.title
        item.name = name
        item.shelfLife = 7
        item.purchaseDate = NSDate.init(timeIntervalSinceNow: 1)
        if var items = category.items{
                items.append(item)
            
            } else {
            
                category.items = [Item]()
                category.items!.append(item)
            }
        
        category.saveInBackgroundWithBlock { (succeded, error) -> Void in
            if error == nil {
                
                print("array of items have been updated in category")
            
            } else {
                
                print("error updating array of items in category")
            }
        }
        
        
        item.saveInBackgroundWithBlock{(success,error) -> Void in
            if success {
                print("list has been saved succesfully")
                self.addItemToFridge(item)
            } else {
                print("There has been an error saving the list object: \(error)")
            }
        }
    }
    
    func addItemToFridge(item:Item){
        let acl = PFACL.init(user: PFUser.currentUser()!)

        if let fridge = self.fridge{
            fridge.ACL = acl
            fridge.items?.append(item)
            fridge.saveInBackgroundWithBlock({ (succeded, error) -> Void in
                if error == nil{
                    print("item has been saved to the fridge succesfully")
                }
                else
                {
                    print("There's been an error saving the item to the fridge")
                }
            })
        }
        else
        {
            self.fridge = Fridge()
            self.fridge!.ACL = acl
            if var items = self.fridge!.items{
                items.append(item)
            }
            else
            {
                self.fridge!.items = [Item]()
                self.fridge!.items?.append(item)
            }
            self.fridge!.saveInBackgroundWithBlock({ (succeded, error) -> Void in
                if error == nil{
                    print("item has been saved to the fridge succesfully")
                }
                else
                {
                    print("There's been an error saving the item to the fridge")
                }
            })
        }
    }
    
    func downloadFridge(completion:()->Void) {
        
        let query = Fridge.query()
        query?.includeKey("items")
        query?.findObjectsInBackgroundWithBlock({ (objects, error) -> Void in
            if error == nil {
            
                let queryFridges:[Fridge]? = objects as? [Fridge]
                
                if let fridges = queryFridges{
                    self.fridge = fridges.first
                    completion()
                } else {
                    print("There are no objects fridges when downloaded")
                    completion()
                }
            } else {
                print("There was an error while downloading fridge")
            }
            
        })
        
    }
    
    func downloadCategories(completion:()->Void){
        
        let query = Category.query()!
        query.includeKey("items")
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if (error == nil) {
                
                if let categoryObjects = objects as? [Category] {
                    self.categories = categoryObjects
                    completion()
                }
                print("Successfully retrieved: \(objects)")
            } else {
                
                print("Error: \(error)")

            }
            
        }
    
    }
    
    func uploadCategories(completion:Category ->Void){
        
        if let filePath = (NSBundle.mainBundle()).pathForResource("SmartCart", ofType: "json") {
            
            do {
                let jsonData = try NSData(contentsOfFile: filePath, options: NSDataReadingOptions.DataReadingMappedIfSafe)
                let jsonDict = try NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                for dict in jsonDict["results"] as! NSArray
                {
                    let category = Category()
                    category.title = dict["Category"] as? String
                    category.items = []
                    let arrayOfItems = dict["Items"] as? NSArray
                    
                    if let arrayOfItems = arrayOfItems
                    {
                        for itemDict in arrayOfItems
                        {
                            let item = Item()
                            item.name = itemDict["name"] as? String
                            item.saveInBackgroundWithBlock({ (succeded, error) -> Void in
                                print("item has been saved from JSON")
                                
                                if error == nil{
                                
                                if var categoryItems = category.items{
                                    category.items!.append(item)
                                    print("the item:\(item)")
                                    if (itemDict as! NSDictionary) == arrayOfItems.lastObject as! NSDictionary
                                    {
                                        print("All Items have been saved from JSON")
                                        category.saveInBackgroundWithBlock({ (succeded, error) -> Void in
                                            if error == nil{
                                                print("category has been saved from JSON:\(category)")
                                            }else
                                            {
                                                print("error while saving category from JSON: \(error)")
                                            }
                                        })
                                        completion(category)

                                     }
                                    }
                                    else
                                    {
                                        print("error saving items to category: \(error)")
                                    }
                                }
                            })
                        }
                    }
                }
            }
            catch
            {
                fatalError("Error parsing the JSON")
            }
            
        }
    }
}
