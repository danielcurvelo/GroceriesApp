//
//  UIImage+CustomImage.swift
//  GroceriesApp
//
//  Created by Mac User on 9/29/15.
//  Copyright © 2015 DanielCurvelo. All rights reserved.
//

import Foundation
import QuartzCore
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
    
    func imageWithColor(color:UIColor) -> UIImage
    {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale);
        let context = UIGraphicsGetCurrentContext()
        CGContextTranslateCTM(context, 0, self.size.height)
        CGContextScaleCTM(context, 1.0, -1.0)
//        CGContextSetBlendMode(context, kCGBlendModeNormal)
        let rect = CGRectMake(0, 0, self.size.width, self.size.height)
        CGContextClipToMask(context, rect, self.CGImage)
        color.setFill()
        CGContextFillRect(context, rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        return image
    }
    
    
    
    
    
    
    
    
    
    

    
    
    
    
    
//    - (UIImage *)imageWithColor:(UIColor *)color1
//    {
//    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextTranslateCTM(context, 0, self.size.height);
//    CGContextScaleCTM(context, 1.0, -1.0);
//    CGContextSetBlendMode(context, kCGBlendModeNormal);
//    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
//    CGContextClipToMask(context, rect, self.CGImage);
//    [color1 setFill];
//    CGContextFillRect(context, rect);
//    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return newImage;
//    }

}