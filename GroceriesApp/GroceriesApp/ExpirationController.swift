//
//  ExpirationController.swift
//  GroceriesApp
//
//  Created by Robert Shepperd on 9/25/15.
//  Copyright © 2015 DanielCurvelo. All rights reserved.
//

import UIKit
import Parse

class ExpirationController: NSObject {
    
    static let sharedInstance = ExpirationController()

    var expirationArrays = []
    
    func seperateItemsByExpiration(items:[Item], completion:()-> Void) {
        
        var replace = [Item]()
        var replaceSoon = [Item]()
        var good = [Item]()
        
        for item in items {
            
            let todaysDate = NSDate.init()
            let todaysDateInterval = NSTimeIntervalSince1970
            let shelfLifeDays = item.shelfLife as! Double / (60 * 60 * 24);
            let daysSincePurchase = todaysDate.timeIntervalSinceDate(item.purchaseDate!) as Double
            let purchaseDate = (NSTimeIntervalSince1970 - daysSincePurchase) as Double
            let daysLeft = todaysDateInterval - (purchaseDate + shelfLifeDays)
            
            if daysLeft <= 1 {
                replace.append(item)
                
            } else if daysLeft <= 4 {
                replaceSoon.append(item)
                
            } else {
                good.append(item)
                
            }
            
            item.setObject(daysLeft, forKey: "daysLeft")
            
            item.saveInBackgroundWithBlock({ (sucess, error) -> Void in
                if error != nil{
                    print("days left\(daysLeft) has been saved to item")
                }
            })
            
            var arrayOfArrays = [[Item]]()
            
            if item == items.last {
                arrayOfArrays.append(replace)
                arrayOfArrays.append(replaceSoon)
                arrayOfArrays.append(good)
                expirationArrays = arrayOfArrays
                completion()
            }
        }
    }
}

