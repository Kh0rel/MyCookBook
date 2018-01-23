//
//  DetailRecipePresenter.swift
//  MyCookBook
//
//  Created by Vincent Durpoix on 23/01/2018.
//  Copyright © 2018 Guillaume Chieb bouares. All rights reserved.
//

import UIKit


protocol DetailRecipeModuleInterface: class {
    
}

protocol DetailRecipeInteractorOutput: class {
    
}

class DetailRecipePresenter: DetailRecipeModuleInterface, DetailRecipeInteractorOutput {
  
    
    
    var interactor: DetailRecipeInteractorOutput!
    var wireframe: DetailRecipeWireframe!
    var detailRecipe: [Recipe] = []

    
   
    
    
}

