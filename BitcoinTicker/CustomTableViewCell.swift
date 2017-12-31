//
//  CustomTableViewCell.swift
//  BitcoinTicker
//
//  Created by Meelad Dawood on 12/30/17.
//  Copyright © 2017 London App Brewery. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var cryptoLabel: UILabel!
    
    @IBOutlet weak var cryptoImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   

}
