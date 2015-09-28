//
//  List.swift
//  GroceriesApp
//
//  Created by Robert Shepperd on 9/18/15.
//  Copyright © 2015 DanielCurvelo. All rights reserved.
//

import UIKit
import Parse

class List: PFObject, PFSubclassing {
    
    @NSManaged var owners: [PFUser]?
    @NSManaged var icon: PFFile?
//    @NSManaged var recipes: [anyObject]?
    @NSManaged var items: [Item]?
    @NSManaged var title: String?
    @NSManaged var tags: [Tag]?
    @NSManaged var categories: [Category]?

    class func parseClassName() -> String {
        return "List"
        
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
