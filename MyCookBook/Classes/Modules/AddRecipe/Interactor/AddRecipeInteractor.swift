//
//  AddRecipeInteractor.swift
//  MyCookBook
//
//  Created by Guillaume Chieb bouares on 02/01/2018.
//  Copyright © 2018 Guillaume Chieb bouares. All rights reserved.
//

import Foundation
import CoreData

protocol AddRecipeInteractorInput: class {
    func createRecipe() -> Recipe
    func persistRecipe(needTo bePersist:Recipe)
}

class AddRecipeInteractor {
    
    weak var output: AddRecipeInteractorOutput!
    
}

extension AddRecipeInteractor: AddRecipeInteractorInput {
    func createRecipe() -> Recipe {
            return Recipe()
    }
    
    func persistRecipe(needTo bePersist: Recipe) {
        
    }
    
    
}
