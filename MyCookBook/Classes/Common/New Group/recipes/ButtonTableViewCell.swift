//
//  ButtonTableViewCell.swift
//  MyCookBook
//
//  Created by PH5153 MacBook on 18/01/2018.
//  Copyright © 2018 Guillaume Chieb bouares. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {
    
    static let cellidentifier:String = "ButtonTableViewCell"

    @IBOutlet weak var leftTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
