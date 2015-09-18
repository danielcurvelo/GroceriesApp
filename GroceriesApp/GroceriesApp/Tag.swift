//
//  Tag.swift
//  GroceriesApp
//
//  Created by Robert Shepperd on 9/18/15.
//  Copyright © 2015 DanielCurvelo. All rights reserved.
//

import UIKit
import Parse

class Tag: PFObject, PFSubclassing {

    @NSManaged var tag: String?
    
    
    class func parseClassName() -> String {
        return "Tag"
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
