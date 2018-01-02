//
//  RecipesTableViewCell.swift
//  MyCookBook
//
//  Created by Guillaume Chieb bouares on 27/12/2017.
//  Copyright © 2017 Guillaume Chieb bouares. All rights reserved.
//

import UIKit
import Cosmos

class RecipesTableViewCell: UITableViewCell {

    @IBOutlet weak var previewRecipe: UIImageView!
    @IBOutlet weak var titleRecipe: UILabel!
    @IBOutlet weak var ratingRecipeDifficulty: CosmosView!
    @IBOutlet weak var descriptionRecipe: UILabel!
    
    var recipe: Recipe? {
        didSet {
            if let recipe = recipe {
                titleRecipe.text = recipe.name
                ratingRecipeDifficulty.rating = recipe.difficulty
                descriptionRecipe.text = recipe.describe
                previewRecipe.image = recipe.picture != nil ? UIImage(data: recipe.picture!) : #imageLiteral(resourceName: "recipe_picture")
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.ratingRecipeDifficulty.isUserInteractionEnabled = false
        self.layer.borderColor = UIColor.clear.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
