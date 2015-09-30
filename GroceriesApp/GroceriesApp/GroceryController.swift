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
        self.downloadFridge { () -> Void in
        
        }
    }
    
    var fridge: Fridge?
    var categories:[Category] = []
    
    func createItemInCategory(category: Category?, name: String?) {
        let item = Item()
        item.category = category
        item.name = name
        item.shelfLife = 7
        
        item.saveInBackgroundWithBlock{(success,error) -> Void in
            if success {
                
                print("list has been saved succesfully")
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
            self.fridge!.items?.append(item)
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
    
    func downloadFridge(completion:()->Void)
    {
        let query = Fridge.query()
        query?.findObjectsInBackgroundWithBlock({ (objects, error) -> Void in
            if error == nil{
            
                let queryFridges:[Fridge]? = objects as? [Fridge]
                
                if let fridges = queryFridges{
                    self.fridge = fridges.first
                    completion()
                }
                else
                {
                    print("There are no objects fridges when downloaded")
                    completion()
                }
            }
            else
            {
                print("There was an error while downloading fridge")
            }
            
        })
        
    }
//    func createAList(title: String) {
//        
//        let list = PFObject(className: "List") as! List
//        list.title = title
//        
//        list.pinInBackgroundWithBlock{(success,error) -> Void in
//            if success {
//                
//                list.saveInBackgroundWithBlock{(success,error) -> Void in
//                    
//                    if success {
//                        
//                        print("list has been saved succesfully")
//                        
//                    } else {
//                        
//                        print("There has been an error saving the list object: \(error)")
//                    }
//                }
//            } else {
//                
//                print("There was an pining the list to the local datastore")
//            }
//        }
//    }
//    var lists: [List] = []
//    
//    func downloadListsFromUser() {
//        let query = List.query()
//        query?.whereKey("owners", containsString: PFUser.currentUser()?.objectId)
//        query?.findObjectsInBackgroundWithBlock({ (objects, error) -> Void in
//            
//            if error != nil{
//                
//                if let listsArray = objects as? [List] {
//                    self.lists = listsArray
//                }
//                
//                print("successful download of lists from user")
//                
//            } else {
//                
//                print("There is an error downloading list from user \(error)")
//            }
//        })
//    }
    
    
    
    func downloadCategories(completion:()->Void){
        
        let query = Category.query()!
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if (error == nil) {
                
                if let categoryObjects = objects as? [Category] {
                    self.categories = categoryObjects
                }
                print("Successfully retrieved: \(objects)")
                completion()
            } else {
                print("Error: \(error)")

            }
            
        }
        
    }

}
