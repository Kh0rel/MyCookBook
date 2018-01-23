//
//  DifficultyTableViewCell.swift
//  MyCookBook
//
//  Created by PH5153 MacBook on 18/01/2018.
//  Copyright © 2018 Guillaume Chieb bouares. All rights reserved.
//

import UIKit
import Cosmos
class DifficultyTableViewCell: UITableViewCell {

    static let cellIdentifier: String = "DifficultyTableViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var difficultyRate: CosmosView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.titleLabel.text = NSLocalizedString("Difficultée", comment: "Difficulity")
        self.difficultyRate.rating = 0.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
