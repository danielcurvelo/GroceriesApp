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
    

    func createItemInCategory(category: Category, name: String, tags: [Tag], icon: PFFile, lists: [List])
    {
        let item = PFObject(className:"Item") as! Item
     
        item.category = category
        item.name = name
        item.tags = tags
        item.icon = icon
        item.lists = lists
        item.shelfLife = 7
        
        save()
    }
    
    func createAList() {
//    let list = NSEntityDescription.insertNewObjectForEntityForName("List", inManagedObjectContext: appDelegate.managedObjectContext!) as! List
//       let mutableUsers = list.users?.mutableCopy()
//        mutableUsers?.addObject(self.user)
//        list.users = mutableUsers as? NSOrderedSet
     save()
       
}
    
//    var categories:[Category]
//    {
//        get{
////            let fetchRequest = NSFetchRequest(entityName:"Category")
////            return (try! appDelegate.managedObjectContext?.executeFetchRequest(fetchRequest)) as! [Category]
//        }
//    }
    
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
    }
    
   
}
