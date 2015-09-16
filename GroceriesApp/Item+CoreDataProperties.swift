//
//  Item+CoreDataProperties.swift
//  GroceriesApp
//
//  Created by Robert Shepperd on 9/16/15.
//  Copyright © 2015 DanielCurvelo. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Item {

    @NSManaged var image: String?
    @NSManaged var name: String?
    @NSManaged var purchase: NSNumber?
    @NSManaged var purchaseDate: NSDate?
    @NSManaged var shelfLife: NSNumber?
    @NSManaged var category: Category?
    @NSManaged var lists: NSOrderedSet?
    @NSManaged var tags: NSOrderedSet?
//  @NSManaged var recipes: NSOrderedSet?
}
