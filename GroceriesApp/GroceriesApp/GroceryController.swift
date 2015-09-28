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
    
    override init() {
        super.init()
    
    }
    
    var categories:[Category] = []
    
    var fridges:[Fridge] = []
    
    func createItemInCategory(category: Category, name: String, tags: [Tag], icon: PFFile, lists: [List]) {
        let item = PFObject(className:"Item") as! Item
        
        item.category = category
        item.name = name
        item.tags = tags
        item.icon = icon
        item.lists = lists
        item.shelfLife = 7
        
        item .pinInBackgroundWithBlock{(success,error) -> Void in
            if success {
                
                item.saveInBackgroundWithBlock{(success,error) -> Void in
                    
                    if success {
                        
                        print("list has been saved succesfully")
                    } else {
                        print("There has been an error saving the list object: \(error)")
                    }
                }
                
            } else {
                
                print("There was an pining the list to the local datastore")
            }
            
        }
    }
    
    func createAList(title: String) {
        
        let list = PFObject(className: "List") as! List
        list.title = title
        
        list.pinInBackgroundWithBlock{(success,error) -> Void in
            if success {
                
                list.saveInBackgroundWithBlock{(success,error) -> Void in
                    
                    if success {
                        
                        print("list has been saved succesfully")
                        
                    } else {
                        
                        print("There has been an error saving the list object: \(error)")
                    }
                }
            } else {
                
                print("There was an pining the list to the local datastore")
            }
        }
    }
    var lists: [List] = []
    
    func downloadListsFromUser() {
        let query = List.query()
        query?.whereKey("owners", containsString: PFUser.currentUser()?.objectId)
        query?.findObjectsInBackgroundWithBlock({ (objects, error) -> Void in
            
            if error != nil{
                
                if let listsArray = objects as? [List] {
                    self.lists = listsArray
                }
                
                print("successful download of lists from user")
                
            } else {
                
                print("There is an error downloading list from user \(error)")
            }
        })
    }
    
    
    
    func downloadCategories() {
        
        let query = Category.query()!
//        query.whereKey("owners", containsString:(PFUser.currentUser()?.objectId))
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if error != nil {
                if let categoryObjects = objects as? [Category] {
                    self.categories = categoryObjects
                }
                print("Successfully retrieved: \(objects)")
            } else {
                print("Error: \(error)")
            }
            
        }
        
    }

    
    
    
    
}
