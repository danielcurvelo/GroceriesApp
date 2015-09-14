//
//  Tag.swift
//  GroceriesApp
//
//  Created by Mac User on 9/14/15.
//  Copyright (c) 2015 DanielCurvelo. All rights reserved.
//

import Foundation
import CoreData

class Tag: NSManagedObject {

    @NSManaged var tag: String
    @NSManaged var items: NSOrderedSet
    @NSManaged var recipes: NSOrderedSet
    @NSManaged var lists: NSOrderedSet

}
