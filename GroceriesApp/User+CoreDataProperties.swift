//
//  User+CoreDataProperties.swift
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

extension User {

    @NSManaged var email: String?
    @NSManaged var name: String?
    @NSManaged var password: String?
    @NSManaged var picture: String?
    @NSManaged var fridges: NSOrderedSet?
    @NSManaged var lists: NSOrderedSet?
    @NSManaged var recipes: NSOrderedSet?

}
