//
//  Tag+CoreDataProperties.swift
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

extension Tag {

    @NSManaged var tag: String?
    @NSManaged var items: NSOrderedSet?
    @NSManaged var lists: NSOrderedSet?
    @NSManaged var recipes: NSOrderedSet?

}
