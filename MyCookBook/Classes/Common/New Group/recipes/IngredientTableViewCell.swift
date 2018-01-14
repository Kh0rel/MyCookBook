//
//  IngredientTableViewCell.swift
//  MyCookBook
//
//  Created by Meryl Barantal on 14/01/2018.
//  Copyright © 2018 Guillaume Chieb bouares. All rights reserved.
//
import UIKit

class IngredientTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: NSLayoutConstraint!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var typeText: UITextField!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var weightText: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

extension IngredientTableViewCell: UITextFieldDelegate {
    
    
}

