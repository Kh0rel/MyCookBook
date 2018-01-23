//
//  RecipesViewController.swift
//  MyCookBook
//
//  Created by Guillaume Chieb bouares on 27/12/2017.
//  Copyright © 2017 Guillaume Chieb bouares. All rights reserved.
//

import UIKit
import WatchConnectivity
import CoreData

protocol RecipesViewInterface: class {
    func showRecipesData(recipes: [Recipe])
    func refreshData()
    func showNoContentScreen()
    func showAddRecipeView()
}

class RecipesViewController: UIViewController {

    static let recipesCellIdentifier = "recipesIdentifier"
    var presenter: RecipesModuleInterface!
    var recipes: [Recipe] = []
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        
        return refreshControl
    }()
    
    @IBOutlet weak var noContentView: UIView!
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("Vos recettes", comment: "Recipes screen title")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "+", style: .plain, target: self, action: #selector(showAddRecipeView))
        self.tableview.register(UINib(nibName: "RecipesTableViewCell", bundle:nil), forCellReuseIdentifier: RecipesViewController.recipesCellIdentifier)
        self.tableview.delegate = self
        self.tableview.dataSource = self
        self.tableview.addSubview(self.refreshControl)
        // Do any additional setup after loading the view.
        
        
        print("iphone app")
        
        if WCSession.isSupported(){
            
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter.updateView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension RecipesViewController: RecipesViewInterface {

    func showRecipesData(recipes: [Recipe]) {
        self.recipes = recipes
        self.tableview.reloadData()
        if self.refreshControl.isRefreshing {
           self.refreshControl.endRefreshing()
        }
    }
    
    func showNoContentScreen() {
        noContentView.isHidden = false
    }
    
    @objc func showAddRecipeView() {
        self.presenter.showAddRecipe()
    }
    
    @objc func refreshData() {
        self.presenter.updateView()
    }
}

extension RecipesViewController: UITableViewDelegate {
    
}

extension RecipesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: RecipesViewController.recipesCellIdentifier) as? RecipesTableViewCell ?? RecipesTableViewCell(style: .default, reuseIdentifier: RecipesViewController.recipesCellIdentifier)
        cell.recipe = self.recipes[indexPath.row]
        return cell
    }
    
    
}

extension RecipesViewController: WCSessionDelegate{
    func sessionDidBecomeInactive(_ session: WCSession) {
        print("inactive")
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        print("inactive")
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("activation iphone OK")
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        print(message)
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        
        if let context = CoreDataManager.shared.objectContext {
            let request: NSFetchRequest<Recipe> = Recipe.fetchRequest()
            if let recipes = try? context.fetch(request) {
                var recipesWatch: [RecipeWatch] = []
                
                for recipe in recipes {
                    var ingredientWatch: [IngredientWatch] = []

                    let ingredients = recipe.ingredients?.allObjects as! [Ingredient];
                    
                    for ingredient in ingredients{
                        ingredientWatch.append(IngredientWatch(name: ingredient.name, type: ingredient.type, weight: ingredient.weight))
                    }
                    
                    let recipeWatch = RecipeWatch(describe: recipe.describe, difficulty: recipe.difficulty, name:recipe.name,ingredientsWatch:ingredientWatch)
                    recipesWatch.append(recipeWatch)
                }
                
                let encodedRecipes = try? JSONEncoder().encode(recipesWatch)
                replyHandler(["recipeList":encodedRecipes ?? []])
            } else {
                replyHandler(["recipeList":[]])
            }
        } else {
            replyHandler(["recipeList":[]])
        }
        
    }
}
