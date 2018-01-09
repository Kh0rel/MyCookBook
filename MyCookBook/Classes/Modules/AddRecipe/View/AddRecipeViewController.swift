//
//  AddRecipeViewController.swift
//  MyCookBook
//
//  Created by Guillaume Chieb bouares on 02/01/2018.
//  Copyright © 2018 Guillaume Chieb bouares. All rights reserved.
//

import UIKit

protocol AddRecipeViewInterface: class {
    func showRecipeData(datas: [NSString])
    func showIngredientsData(ingredients: [Ingredient])
    func showStepsData(steps: [Step])
}

class AddRecipeViewController: UIViewController {
    
    static let recipeCellIdentifier = "recipeIdentifier"
    var presenter: AddRecipeModuleInterface!
    var datas: [NSString] = []
    

    @IBOutlet weak var recipeTableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("Ajouter une recette", comment: "Add recipe screen title")
        
        self.recipeTableview.register(UINib(nibName: "RecipeTableViewCell", bundle:nil), forCellReuseIdentifier: AddRecipeViewController.recipeCellIdentifier)
        
        self.recipeTableview.delegate = self
        self.recipeTableview.dataSource = self
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

extension AddRecipeViewController: AddRecipeViewInterface{
    func showIngredientsData(ingredients: [Ingredient]) {
        //self.ingredients = ingredients
    }
    
    func showStepsData(steps: [Step]) {
        //self.steps = steps
    }
    
    func showRecipeData(datas: [NSString]){
        self.datas = datas
        self.recipeTableview.reloadData()
    }
}

extension AddRecipeViewController: UITableViewDelegate{
    
}

extension AddRecipeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = recipeTableview.dequeueReusableCell(withIdentifier: AddRecipeViewController.recipeCellIdentifier) as? TextFieldTableViewCell ?? TextFieldTableViewCell(style:.default, reuseIdentifier: AddRecipeViewController.recipeCellIdentifier)
        
        //cell.titleLabel = self.datas[indexPath.row]
        return cell
    }
}
