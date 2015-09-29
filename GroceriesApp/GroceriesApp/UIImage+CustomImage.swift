//
//  UIImage+CustomImage.swift
//  GroceriesApp
//
//  Created by Mac User on 9/29/15.
//  Copyright © 2015 DanielCurvelo. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {


    class func imageFromColor(color:UIColor,size:CGSize) -> UIImage
    {
        let rect = CGRectMake(0, 0, size.width, size.height)
        UIGraphicsBeginImageContext(rect.size)
        
        let context = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextFillRect(context, rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        UIGraphicsBeginImageContext(size)
        image.drawInRect(rect)
        UIGraphicsEndImageContext()
        
        return image
    }

}