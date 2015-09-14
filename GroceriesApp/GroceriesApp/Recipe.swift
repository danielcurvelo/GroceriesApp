//
//  Recipe.swift
//  GroceriesApp
//
//  Created by Mac User on 9/14/15.
//  Copyright (c) 2015 DanielCurvelo. All rights reserved.
//

import Foundation
import CoreData

class Recipe: NSManagedObject {

    @NSManaged var title: String
    @NSManaged var image: String
    @NSManaged var recipeSummary: String
    @NSManaged var cookingDirections: String
    @NSManaged var items: NSOrderedSet
    @NSManaged var lists: NSOrderedSet
    @NSManaged var tags: NSOrderedSet
    @NSManaged var user: User

}
