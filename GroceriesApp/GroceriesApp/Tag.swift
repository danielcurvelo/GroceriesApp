//
//  Tag.swift
//  GroceriesApp
//
//  Created by Mac User on 9/15/15.
//  Copyright (c) 2015 DanielCurvelo. All rights reserved.
//

import Foundation
import CoreData

class Tag: NSManagedObject {

    @NSManaged var tag: String
    @NSManaged var items: NSOrderedSet
    @NSManaged var lists: NSOrderedSet
    @NSManaged var recipes: NSOrderedSet

}
