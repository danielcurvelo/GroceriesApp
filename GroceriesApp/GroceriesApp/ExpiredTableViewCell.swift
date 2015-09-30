//
//  ExpiredTableViewCell.swift
//  GroceriesApp
//
//  Created by Douglas Goodwin on 9/29/15.
//  Copyright © 2015 DanielCurvelo. All rights reserved.
//

import UIKit

class ExpiredTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var expirationIdentifier: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
