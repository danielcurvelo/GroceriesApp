//: Playground - noun: a place where people can play

import UIKit

var str = "Future Versions Go Here"


//V2

//self.downloadFridges()

//    func createInitiaFridge() {
//
//        let fridge = PFObject(className: "Fridge") as! Fridge
//        fridge.title = "My Fridge"
//
//        var mutableOwners = fridge.owners as [PFUser]?
//        mutableOwners?.append(PFUser.currentUser()!)
//        fridge.owners = mutableOwners as [PFUser]?
//
//    }

//    func downloadFridges() {
//
//        let query = Fridge.query()!
//        query.whereKey("owners", containsString:(PFUser.currentUser()?.objectId))
//        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
//            if error != nil {
//                if let fridgeObjects = objects as? [Fridge] {
//                    self.fridges = fridgeObjects
//                }
//                print("Successfully retrieved: \(objects)")
//            } else {
//                print("Error: \(error)")
//            }
//
//        }
//
//    }
