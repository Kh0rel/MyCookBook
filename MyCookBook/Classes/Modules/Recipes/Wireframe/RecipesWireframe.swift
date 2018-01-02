//
//  RecipesWireframe.swift
//  MyCookBook
//
//  Created by Guillaume Chieb bouares on 27/12/2017.
//  Copyright © 2017 Guillaume Chieb bouares. All rights reserved.
//

import Foundation
import UIKit

protocol RecipesWireframeInput {
    func presentDetailsInterfaceForRecipes(recipe: Recipe)
    func presentAddInterfaceForRecipes()
}

class RecipesWireframe: NSObject {
    
    weak var recipesViewController: RecipesViewController!
    
    public static func assembleModule() -> UIViewController {
        let view = RecipesViewController()
        let presenter = RecipesPresenter()
        let interactor = RecipesInteractor()
        let wireframe = RecipesWireframe()
        
        let navigation = UINavigationController(rootViewController: view)
        
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        presenter.view = view
        
        interactor.output = presenter
        wireframe.recipesViewController = view
        
        return navigation
    }
    
}

extension RecipesWireframe: RecipesWireframeInput {
    func presentAddInterfaceForRecipes() {
        let addRecipeViewController = AddRecipeWireframe.assembleModule()
        
        self.recipesViewController.navigationController?.pushViewController(addRecipeViewController, animated: true)
    }
    
    func presentDetailsInterfaceForRecipes(recipe: Recipe) {
        
    }
}
