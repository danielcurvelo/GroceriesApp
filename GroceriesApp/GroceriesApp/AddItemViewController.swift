//
//  AddItemViewController.swift
//  GroceriesApp
//
//  Created by Roark on 9/29/15.
//  Copyright © 2015 DanielCurvelo. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {
    
    @IBOutlet var alertViewBackground: UIView!
    var animator:UIDynamicAnimator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.animator = UIDynamicAnimator.init(referenceView: self.view)
        //    // Use UIKit Dynamics to make the alertView appear.
        self.show()

    }

    func show() {
        
        UIView.animateWithDuration(1) { () -> Void in
            self.alertViewBackground.alpha = 1.0
        }
        
        let snapBehavior = UISnapBehavior.init(item: self.alertViewBackground, snapToPoint: self.view.center)
        snapBehavior.damping = 0.50
        self.animator?.addBehavior(snapBehavior)
        
    }
    
    
    
    
//    -(void)show {
//    // Assume the view is offscreen. Use a Snap behaviour to position it in the center of the screen.
//    
//    
//    // Animate in the background blind
//    [UIView animateWithDuration:2 animations:^{
//    self.alertView.alpha = 1.0f;
//    }];
//    
//    // Use UIKit Dynamics to make the alertView appear.
//    UISnapBehavior *snapBehaviour = [[UISnapBehavior alloc] initWithItem:self.alertView snapToPoint:self.view.center];
//    snapBehaviour.damping = 3.0f;
//    [self.animator addBehavior:snapBehaviour];
//    
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
