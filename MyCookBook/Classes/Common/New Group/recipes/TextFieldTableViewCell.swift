//
//  TextFieldTableViewCell.swift
//  MyCookBook
//
//  Created by Guillaume Chieb bouares on 03/01/2018.
//  Copyright © 2018 Guillaume Chieb bouares. All rights reserved.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textField.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension TextFieldTableViewCell: UITextFieldDelegate {
    
    
}
