//
//  RecipesInteractor.swift
//  MyCookBook
//
//  Created by Guillaume Chieb bouares on 27/12/2017.
//  Copyright © 2017 Guillaume Chieb bouares. All rights reserved.
//

import Foundation
import CoreData

protocol RecipesInteractorInput: class {
    func fetchRecipes()
}

class RecipesInteractor: RecipesInteractorInput {
    
    weak var output: RecipesInteractorOutput!
    
    
    
    func fetchRecipes() {
        if let context = CoreDataManager.shared.objectContext?.viewContext {
            let request: NSFetchRequest<Recipe> = Recipe.fetchRequest()
            if let recipes = try? context.fetch(request) {
                output.recipesFetched(recipes: recipes)
            } else {
                output.recipesFetched(recipes: [])
            }
        } else {
            output.recipesFetched(recipes: [])
        }
    }
    
    
}
