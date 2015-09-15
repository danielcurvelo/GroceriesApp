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
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

    func createItemInCategory(category:Category, name:String, shelfLife: NSNumber, tags: NSOrderedSet)
    {
        let item = NSEntityDescription.insertNewObjectForEntityForName("Item", inManagedObjectContext:appDelegate.managedObjectContext!) as! Item
        item.name = name
        item.category = category
        item.shelfLife = shelfLife
        item.tags = tags
        save()
    }

    var categories:[Category]
    {
        get{
            let fetchRequest = NSFetchRequest(entityName:"Category")
            return appDelegate.managedObjectContext?.executeFetchRequest(fetchRequest, error:nil) as! [Category]
        }
    }
    
    func save()
    {
        appDelegate.managedObjectContext?.save(nil)
    }
    
    
    

   
}
