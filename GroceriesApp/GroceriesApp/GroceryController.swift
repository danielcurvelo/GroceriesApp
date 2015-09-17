//
//  GroceryController.swift
//  GroceriesApp
//
//  Created by Mac User on 9/15/15.
//  Copyright (c) 2015 DanielCurvelo. All rights reserved.
//

import UIKit
import CoreData

class GroceryController: NSObject {
    
    var user: User
    {
        get{
            let fetchRequest = NSFetchRequest(entityName: "User")
            return (try! appDelegate.managedObjectContext?.executeFetchRequest(fetchRequest).first) as! User
            }
    }
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

    func createItemInCategory(category: Category, name: String, shelfLife: NSNumber, tags: NSOrderedSet, image: String, purchase: NSNumber, purchaseDate: NSDate, lists: NSOrderedSet)
    {
        let item = NSEntityDescription.insertNewObjectForEntityForName("Item", inManagedObjectContext:appDelegate.managedObjectContext!) as! Item
        item.name = name
        item.category = category
        item.shelfLife = shelfLife
        item.tags = tags
        item.purchaseDate = purchaseDate
        item.purchase = purchase
        item.lists = lists
        item.image = image
        
        save()
    }
    
    func createAList() {
    let list = NSEntityDescription.insertNewObjectForEntityForName("List", inManagedObjectContext: appDelegate.managedObjectContext!) as! List
       let mutableUsers = list.users?.mutableCopy()
        mutableUsers?.addObject(self.user)
        list.users = mutableUsers as? NSOrderedSet
     save()
       
}
    
    var categories:[Category]
    {
        get{
            let fetchRequest = NSFetchRequest(entityName:"Category")
            return (try! appDelegate.managedObjectContext?.executeFetchRequest(fetchRequest)) as! [Category]
        }
    }
    
    var fridges:[Fridge]
        {
        get {
            return user.fridges?.array as! [Fridge]
        }
        
    }
    
    var lists: [List]
        {
        get {
            return user.lists?.array as! [List]
        }
    }
    
    func save()
    {
        do {
            try appDelegate.managedObjectContext?.save()
        } catch _ {
        }
    }
    
   
}
