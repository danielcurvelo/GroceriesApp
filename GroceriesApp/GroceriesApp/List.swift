//
//  List.swift
//  GroceriesApp
//
//  Created by Mac User on 9/15/15.
//  Copyright (c) 2015 DanielCurvelo. All rights reserved.
//

import Foundation
import CoreData

class List: NSManagedObject {

    @NSManaged var date: NSDate
    @NSManaged var icon: String
    @NSManaged var listTitle: String
    @NSManaged var items: NSOrderedSet
    @NSManaged var recipes: NSOrderedSet
    @NSManaged var tags: NSOrderedSet
    @NSManaged var users: NSOrderedSet

}
