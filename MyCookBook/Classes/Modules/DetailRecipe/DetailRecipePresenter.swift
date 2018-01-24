//
//  DetailRecipePresenter.swift
//  MyCookBook
//
//  Created by Vincent Durpoix on 23/01/2018.
//  Copyright © 2018 Guillaume Chieb bouares. All rights reserved.
//

import UIKit


protocol DetailRecipeModuleInterface: class {
    func getRecipe() -> Recipe
}

protocol DetailRecipeInteractorOutput: class {
    
}

class DetailRecipePresenter {
    
    weak var view: DetailRecipeViewController!
    
    var interactor: DetailRecipeInteractorInput!
    var wireframe: DetailRecipeWireframe!
    
    var recipe: Recipe?
    
    init(recipe:Recipe) {
        self.recipe = recipe
    }
    
}

extension DetailRecipePresenter: DetailRecipeModuleInterface {
    func getRecipe() -> Recipe {
        return self.recipe!
    }
    
}

extension DetailRecipePresenter: DetailRecipeInteractorOutput {
    
}


