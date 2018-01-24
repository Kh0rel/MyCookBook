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

    static let recipesCellIdentifier = "RecipesCollectionViewCell"
    var presenter: RecipesModuleInterface!
    var recipes: [Recipe] = []
    

    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        
        return refreshControl
    }()
    
    @IBOutlet weak var noContentView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.register(UINib(nibName: "RecipesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: RecipesViewController.recipesCellIdentifier)
        self.title = NSLocalizedString("Vos recettes", comment: "Recipes screen title")
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.blue]
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "+", style: .plain, target: self, action: #selector(showAddRecipeView))
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.backgroundColor = .clear
        self.collectionView.contentInset = UIEdgeInsets(top: 8, left: 10, bottom: 8, right: 14)
        
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
    }
}

extension RecipesViewController: RecipesViewInterface {

    func showRecipesData(recipes: [Recipe]) {
        self.recipes = recipes
        self.collectionView.reloadData()
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

extension RecipesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.presenter.showDetailsForRecipe(recipe: self.recipes[indexPath.row])
    }
}

extension RecipesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.recipes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecipesViewController.recipesCellIdentifier, for: indexPath) as! RecipesCollectionViewCell
        
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
        
        if let context = CoreDataManager.shared.objectContext?.viewContext {
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
