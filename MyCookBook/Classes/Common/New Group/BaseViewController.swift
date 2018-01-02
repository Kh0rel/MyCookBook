//
//  BaseViewController.swift
//  MyCookBook
//
//  Created by Guillaume Chieb bouares on 02/01/2018.
//  Copyright © 2018 Guillaume Chieb bouares. All rights reserved.
//

import UIKit

class BaseViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        /*if let context = CoreDataManager.shared.objectContext {
            let recipe: Recipe = Recipe(context: context)
            recipe.name = "Test"
            recipe.describe = "description test aeizje aizhbe ihabqsdihbaz ibdziebf iqpubfliq jzdkbsflzhakebf iqzlkdbf ialezkbfai zelkhbfizeklqb fizqelkfb zekpjfb izeqklbf aizeok bfijl"
            recipe.difficulty = 2.5
            try? context.save()
        }*/
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
