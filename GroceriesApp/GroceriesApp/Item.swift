//
//  Item.swift
//  GroceriesApp
//
//  Created by Mac User on 9/15/15.
//  Copyright (c) 2015 DanielCurvelo. All rights reserved.
//

import Foundation
import CoreData

class Item: NSManagedObject {

    @NSManaged var image: String
    @NSManaged var purchase: NSNumber
    @NSManaged var purchaseDate: NSDate
    @NSManaged var shelfLife: NSNumber
    @NSManaged var lists: NSOrderedSet
    @NSManaged var recipes: NSOrderedSet
    @NSManaged var tags: NSOrderedSet
    @NSManaged var category: Category

}
