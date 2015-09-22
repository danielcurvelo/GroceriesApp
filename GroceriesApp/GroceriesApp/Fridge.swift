//
//  Fridge.swift
//  GroceriesApp
//
//  Created by Robert Shepperd on 9/18/15.
//  Copyright © 2015 DanielCurvelo. All rights reserved.
//

import Parse
import UIKit

class Fridge: PFObject, PFSubclassing {

    @NSManaged var icon: PFFile?
    @NSManaged var title: String?
    @NSManaged var categories: [Category]?
    @NSManaged var owners: [PFUser]?
    
    class func parseClassName() -> String {
        return "Fridge";    }
    
    override class func initialize() {
        struct Static {
            static var onceToken : dispatch_once_t = 0;
        }
        dispatch_once(&Static.onceToken) {
            self.registerSubclass()
        }
    }
    
}
