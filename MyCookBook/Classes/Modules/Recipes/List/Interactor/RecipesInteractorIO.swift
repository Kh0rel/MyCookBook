//
//  RecipesInteractorIO.swift
//  MyCookBook
//
//  Created by Guillaume Chieb bouares on 11/12/2017.
//  Copyright © 2017 Guillaume Chieb bouares. All rights reserved.
//

import Foundation


protocol RecipesInteractorInput {
    func findUpcomingRecipes()
}

protocol RecipesInteractorOutput {
    func foundUpcomingRecipes(_ upcomingRecipes: [Recipe])
}
