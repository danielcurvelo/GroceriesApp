//
//  Category.swift
//  GroceriesApp
//
//  Created by Mac User on 9/15/15.
//  Copyright (c) 2015 DanielCurvelo. All rights reserved.
//

import Foundation
import CoreData

class Category: NSManagedObject {

    @NSManaged var title: String
    @NSManaged var colorIdentifier: NSNumber
    @NSManaged var items: NSOrderedSet

}
