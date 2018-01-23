//
//  IngredientTableViewCell.swift
//  MyCookBook
//
//  Created by Meryl Barantal on 14/01/2018.
//  Copyright © 2018 Guillaume Chieb bouares. All rights reserved.
//
import UIKit

class IngredientTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var type: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    var ingredient: Ingredient! {
        didSet {
            name.text = ingredient.name ?? ""
            weight.text = String(ingredient.weight)
            type.text = ingredient.type ?? ""
        }
    }
    
    var modifiedIngredient: Ingredient {
        get {
            ingredient.name = name.text
            ingredient.weight = (weight.text! as NSString).doubleValue
            ingredient.type = type.text
 
            return ingredient
        }
    }
    
}

extension IngredientTableViewCell: UITextFieldDelegate {
    
    
}

