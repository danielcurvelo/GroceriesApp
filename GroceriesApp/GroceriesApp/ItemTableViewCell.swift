//
//  ItemTableViewCell.swift
//  GroceriesApp
//
//  Created by Douglas Goodwin on 9/17/15.
//  Copyright © 2015 DanielCurvelo. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    @IBOutlet weak var iconContainer: UIView!

    @IBOutlet weak var expirationIdentifier: UIView!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var icon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        
        icon.tintColor = UIColor.groceryLightGreenColor()
        iconContainer.backgroundColor = UIColor.groceryDarkGreenColor()
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
