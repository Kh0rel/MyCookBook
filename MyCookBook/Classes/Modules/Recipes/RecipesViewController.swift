//
//  RecipesViewController.swift
//  MyCookBook
//
//  Created by Guillaume Chieb bouares on 27/12/2017.
//  Copyright © 2017 Guillaume Chieb bouares. All rights reserved.
//

import UIKit

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
