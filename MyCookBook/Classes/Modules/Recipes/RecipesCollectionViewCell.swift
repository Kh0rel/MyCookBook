//
//  RecipesCollectionViewCell.swift
//  MyCookBook
//
//  Created by Guillaume Chieb bouares on 23/01/2018.
//  Copyright © 2018 Guillaume Chieb bouares. All rights reserved.
//

import UIKit
import Cosmos

class RecipesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var difficulty: CosmosView!
    
    var recipe: Recipe! {
        didSet {
            imageView.image = recipe.picture != nil ? UIImage(data: recipe.picture as! Data) : #imageLiteral(resourceName: "recipe_picture")
            title.text = recipe.name
            difficulty.rating = recipe.difficulty
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        difficulty.settings.updateOnTouch = false
    }

}
