//
//  RecipesPresenter.swift
//  MyCookBook
//
//  Created by Guillaume Chieb bouares on 27/12/2017.
//  Copyright © 2017 Guillaume Chieb bouares. All rights reserved.
//

import Foundation

protocol RecipesModuleInterface: class {
    func updateView()
    func showDetailsForRecipe(recipe: Recipe)
    func showAddRecipe()
}

protocol RecipesInteractorOutput: class {
    func recipesFetched(recipes: [Recipe])
}

class RecipesPresenter: RecipesModuleInterface, RecipesInteractorOutput {
    
    weak var view: RecipesViewInterface!
    
    var interactor: RecipesInteractorInput!
    var wireframe: RecipesWireframe!
    var recipes: [Recipe] = []
    
    //MARK: - RecipesModuleInterface methods
    func updateView() {
        self.interactor.fetchRecipes()
    }
    
    func showAddRecipe() {
        self.wireframe.presentAddInterfaceForRecipes()
    }
    
    func showDetailsForRecipe(recipe: Recipe) {
        
    }
    
    //MARK: - RecipesInteractorOutput methods
    func recipesFetched(recipes: [Recipe]) {
        if recipes.count > 0 {
            self.recipes = recipes
            self.view.showRecipesData(recipes: recipes)
        } else {
            self.view.showNoContentScreen()
        }
    }
    
    
}
