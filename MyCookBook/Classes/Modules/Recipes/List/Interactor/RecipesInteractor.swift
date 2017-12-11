//
//  RecipesInteractor.swift
//  MyCookBook
//
//  Created by Guillaume Chieb bouares on 11/12/2017.
//  Copyright © 2017 Guillaume Chieb bouares. All rights reserved.
//

import Foundation


class RecipesInteractor: NSObject, RecipesInteractorInput {
    var output: RecipesInteractorOutput?
    
    let dataManager: RecipesDataManager
    
    init(dataManager: RecipesDataManager) {
        self.dataManager = dataManager
    }
    
    func findUpcomingRecipes() {
        dataManager.getAllRecipes { (recipes:[Recipe]!) in
            self.output?.foundUpcomingRecipes(recipes)
        }
    }
}
