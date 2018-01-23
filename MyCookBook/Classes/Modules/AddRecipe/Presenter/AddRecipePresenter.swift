//
//  AddRecipePresenter.swift
//  MyCookBook
//
//  Created by Guillaume Chieb bouares on 02/01/2018.
//  Copyright © 2018 Guillaume Chieb bouares. All rights reserved.
//

import Foundation
import UIKit
protocol AddRecipeModuleInterface: class {
    func updateView()
    func setSteps(steps:[Step])
    func setIngredients(ingredients:[Ingredient])
    func setRecipeMainInfo(name:String,describe:String,difficulty:Double?,image:UIImage?)
    func saveRecipe()
    func getSteps() -> [Step]
}

protocol AddRecipeInteractorOutput: class {
    
}

class AddRecipePresenter {
    
    weak var view: AddRecipeViewController!
    
    var interactor: AddRecipeInteractorInput!
    var wireframe: AddRecipeWireframe!
    
    var recipe: Recipe?
    
}

extension AddRecipePresenter: AddRecipeModuleInterface {
    func getSteps() -> [Step] {
        
        let steps = CoreDataManager.shared.getStepByRecipeName(recipeName: (recipe?.name)!)
        return steps
    }
    
    func setRecipeMainInfo(name: String, describe: String, difficulty: Double?, image: UIImage?) {
        self.recipe?.name = name
        self.recipe?.describe = describe
        self.recipe?.difficulty = difficulty ?? 0.0
        self.recipe?.picture = UIImagePNGRepresentation(image!) ?? UIImagePNGRepresentation(#imageLiteral(resourceName: "recipe_picture"))
    }
    
    func setIngredients(ingredients: [Ingredient]) {
        
    }
    
    func updateView() {
       self.recipe = interactor.createRecipe()
    }
    
    func showRecipes() {
        
    }
    
    func setSteps(steps: [Step]) {
        for step in steps {
            recipe?.addToSteps(step)
        }
    }
    
    func saveRecipe() {
        self.interactor.persistRecipe(needTo: self.recipe!)
    }
}

extension AddRecipePresenter: AddRecipeInteractorOutput {
    
}
