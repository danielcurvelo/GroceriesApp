//: Playground - noun: a place where people can play

import UIKit


//Expiration date 
let daysBeforeToday:Double = 0
let purchaseDate = NSTimeIntervalSince1970 - daysBeforeToday
var shelfLife:Double =  604800
let expiration =  shelfLife + purchaseDate
let daysLeft = expiration - NSTimeIntervalSince1970
let days = daysLeft / (60*60*24)



