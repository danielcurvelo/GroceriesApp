//
//  User.swift
//  GroceriesApp
//
//  Created by Mac User on 9/15/15.
//  Copyright (c) 2015 DanielCurvelo. All rights reserved.
//

import Foundation
import CoreData

class User: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var email: String
    @NSManaged var picture: String
    @NSManaged var password: String
    @NSManaged var lists: NSOrderedSet
    @NSManaged var recipes: NSOrderedSet

}
