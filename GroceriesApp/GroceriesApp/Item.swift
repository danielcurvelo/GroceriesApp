//
//  Item.swift
//  GroceriesApp
//
//  Created by Robert Shepperd on 9/18/15.
//  Copyright © 2015 DanielCurvelo. All rights reserved.
//

import UIKit
import Parse

class Item: PFObject, PFSubclassing {
    
    @NSManaged var items: [Item]?
    @NSManaged var title: String?
    @NSManaged var colorIdentifier: NSNumber?
    @NSManaged var fridges: [Fridge]?
    @NSManaged var category: Category?
    @NSManaged var purchaseDate: NSDate?
    @NSManaged var tags: [Tag]?
    @NSManaged var lists: [List]?
    @NSManaged var shelfLife: NSNumber?
    @NSManaged var icon: String?
    
    
    class func parseClassName() -> String {
        return "Item"
    }
    
    override class func initialize() {
        struct Static {
            static var onceToken : dispatch_once_t = 0;
        }
        dispatch_once(&Static.onceToken) {
            self.registerSubclass()
        }
    }
}
