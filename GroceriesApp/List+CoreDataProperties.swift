//
//  List+CoreDataProperties.swift
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

extension List {

    @NSManaged var date: NSDate?
    @NSManaged var icon: String?
    @NSManaged var listTitle: String?
    @NSManaged var items: NSOrderedSet?
    @NSManaged var recipes: NSOrderedSet?
    @NSManaged var tags: NSOrderedSet?
    @NSManaged var users: NSOrderedSet?

}
