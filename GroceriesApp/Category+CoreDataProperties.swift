//
//  Category+CoreDataProperties.swift
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

extension Category {

    @NSManaged var colorIdentifier: NSNumber?
    @NSManaged var title: String?
    @NSManaged var fridges: NSOrderedSet?
    @NSManaged var items: NSOrderedSet?

}
