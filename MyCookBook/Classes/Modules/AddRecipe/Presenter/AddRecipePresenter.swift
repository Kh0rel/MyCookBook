//
//  AddRecipePresenter.swift
//  MyCookBook
//
//  Created by Guillaume Chieb bouares on 02/01/2018.
//  Copyright © 2018 Guillaume Chieb bouares. All rights reserved.
//

import Foundation

protocol AddRecipeModuleInterface: class {
    func updateView()
    func showRecipes()
}

protocol AddRecipeInteractorOutput: class {
    
}

class AddRecipePresenter {
    
    weak var view: AddRecipeViewController!
    
    var interactor: AddRecipeInteractorInput!
    var wireframe: AddRecipeWireframe!
    
}

extension AddRecipePresenter: AddRecipeModuleInterface {
    func updateView() {
        
    }
    
    func showRecipes() {
        
    }
}

extension AddRecipePresenter: AddRecipeInteractorOutput {
    
}
