//
//  File.swift
//  MyCookBook
//
//  Created by Vincent Durpoix on 13/01/2018.
//  Copyright © 2018 Guillaume Chieb bouares. All rights reserved.
//

import Foundation

class RecipeWatch: Codable {
    var describe: String?
    var difficulty: Double
    var name: String?
    var ingredientsWatch: [IngredientWatch]?
    
    init(describe: String?,difficulty:Double,name:String?,ingredientsWatch:[IngredientWatch]?) {
        self.describe = describe
        self.name = name
        self.difficulty = difficulty
        self.ingredientsWatch = ingredientsWatch
    }
}
