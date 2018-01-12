//
//  AddRecipeViewController.swift
//  MyCookBook
//
//  Created by Guillaume Chieb bouares on 02/01/2018.
//  Copyright © 2018 Guillaume Chieb bouares. All rights reserved.
//

import UIKit

protocol AddRecipeViewInterface: class {

}

class AddRecipeViewController: UIViewController {
    
    static let recipeCellIdentifier = "recipeIdentifier"
    var presenter: AddRecipeModuleInterface!
    
    var recipe : [String] = []
    var ingredients : [Ingredient] = []
    var steps : [Step] = []
    var datas : NSDictionary = [:]
    
    var recipeInformations: [String] = []
    

    @IBOutlet weak var recipeTableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("Ajouter une recette", comment: "Add recipe screen title")
        
        recipeInformations.append(NSLocalizedString("Recette", comment: "Recipe informations"))
        recipeInformations.append(NSLocalizedString("Ingredients", comment: "Ingredients informations"))
        recipeInformations.append(NSLocalizedString("Etapes", comment: "Steps informations"))
        
        recipe.append(NSLocalizedString("Nom", comment: "Recipe name"))
        recipe.append(NSLocalizedString("Description", comment: "Recipe describe"))
        recipe.append(NSLocalizedString("Difficulté", comment: "Recipe difficulty"))
        recipe.append(NSLocalizedString("Image", comment: "Recipe picture"))



        
        self.recipeTableview.register(UINib(nibName: "TextFieldTableViewCell", bundle:nil), forCellReuseIdentifier: AddRecipeViewController.recipeCellIdentifier)
        
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

}

extension AddRecipeViewController: UITableViewDelegate{
    
}

extension AddRecipeViewController: UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return self.recipe.count
        }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = recipeTableview.dequeueReusableCell(withIdentifier: AddRecipeViewController.recipeCellIdentifier) as? TextFieldTableViewCell ?? TextFieldTableViewCell(style:.default, reuseIdentifier: AddRecipeViewController.recipeCellIdentifier)
        
            cell.titleLabel.text = self.recipe[indexPath.row]
                return cell
        }
    
}
