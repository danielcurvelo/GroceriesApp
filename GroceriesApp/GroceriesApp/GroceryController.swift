//
//  GroceryController.swift
//  GroceriesApp
//
//  Created by Mac User on 9/15/15.
//  Copyright (c) 2015 DanielCurvelo. All rights reserved.
//

import UIKit
import Parse


class GroceryController: NSObject {
    
    var fridges:[Fridge]?
//    var user = PFUser .currentUser()?
    
    func createItemInCategory(category: Category, name: String, tags: [Tag], icon: PFFile, lists: [List])
    {
        let item = PFObject(className:"Item") as! Item
     
        item.category = category
        item.name = name
        item.tags = tags
        item.icon = icon
        item.lists = lists
        item.shelfLife = 7
        
        item.saveEventually()
    }

    func createAList(title: String) {

        let list = PFObject(className: "List") as! List
        
        list.title = title
        
        list.saveEventually()
        
    }
    
//    func downloadFridges()
//    {
//        let query = Fridge.query() as PFQuery?
//
//        if let query = query {
//            query.findObjectsInBackgroundWithBlock({ (fridges :[Fridge]?, error: NSError?) -> Void in
//                if let fridges = fridges{
//                    self.fridges = fridges
//                }
//            })
//        }
//    }
    
//    var lists: [List]
//        {
//        get {
//            return user("lists":[List]?) as! [List]
//        }
//    }
//    
    func save()
    {
    }
    
   
}
