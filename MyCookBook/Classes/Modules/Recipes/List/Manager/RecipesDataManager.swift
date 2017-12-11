//
//  RecipesDataManager.swift
//  MyCookBook
//
//  Created by Guillaume Chieb bouares on 11/12/2017.
//  Copyright © 2017 Guillaume Chieb bouares. All rights reserved.
//

import Foundation
import CoreData
class RecipesDataManager: NSObject {
    
    func getAllRecipes(completion: (([Recipe]) -> Void)!) {
        if let context = CoreDataManager.shared.objectContext {
            let request: NSFetchRequest<Recipe> = Recipe.fetchRequest()
            if let recipes = try? context.fetch(request) {
                completion(recipes)
            } else {
                completion([])
            }
        }
    }
}
