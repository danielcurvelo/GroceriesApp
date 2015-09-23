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
    
    static let sharedInstance = GroceryController()
    
    var fridges:[Fridge] = []
    
    func createItemInCategory(category: Category, name: String, tags: [Tag], icon: PFFile, lists: [List]) {
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
        
        list.saveInBackgroundWithBlock{(success,error) -> Void in
            
            
        
        }
        
    }
    
    func downloadFridges() {
    
        let query = Fridge.query()!
        query.whereKey("owners", containsString:(PFUser.currentUser()?.objectId))
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
          if error != nil {
            if let fridgeObjects = objects as? [Fridge] {
                self.fridges = fridgeObjects
            }
            print("Successfully retrieved: \(objects)")
          } else {
            print("Error: \(error)")
          }

        }
    
    }
   
}
