//
//  BaseViewController.swift
//  MyCookBook
//
//  Created by Guillaume Chieb bouares on 02/01/2018.
//  Copyright © 2018 Guillaume Chieb bouares. All rights reserved.
//

import UIKit
import WatchConnectivity

class BaseViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        if let context = CoreDataManager.shared.objectContext {
            let recipe = Recipe(context: context)
            recipe.name = "Test3"
            recipe.describe = "2 test aeizje aizhbe ihabqsdihbaz ibdziebf iqpubfliq jzdkbsflzhakebf iqzlkdbf ialezkbfai zelkhbfizeklqb fizqelkfb zekpjfb izeqklbf aizeok bfijl"
            recipe.difficulty = 4
            
            let ingredient = Ingredient(context: context)
            ingredient.name = "Pomme"
            ingredient.type = "Fruits"
            ingredient.weight = 15
            
            recipe.addToIngredients(ingredient)
            
            ingredient.name = "Poire"
            ingredient.type = "Fruits"
            ingredient.weight = 50
            recipe.addToIngredients(ingredient)
            
            try? context.save()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let recipesViewController = RecipesWireframe.assembleModule()
        let recipesTabBarItem = UITabBarItem(title: "Recipes", image: #imageLiteral(resourceName: "tabbar_recipe_image"), tag: 1)
        
        recipesViewController.tabBarItem = recipesTabBarItem
        
        self.viewControllers = [recipesViewController]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}

extension BaseViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected \(viewController.title!)")
    }
}




