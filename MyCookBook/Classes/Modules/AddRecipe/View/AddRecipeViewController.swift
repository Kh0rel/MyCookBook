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
    
    static let textCellIdentifier = "textIdentifier"
    static let imageCellIdentifier = "imageIdentifier"
    static let sectionCellIdentifier = "sectionIdentifier"
    static let ingredientCellIdentifier = "ingredientIdentifier"
    static let stepCellIdentifier = "stepIdentifier"
    
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
        
        
        recipe.append(NSLocalizedString("Recette", comment: "Recipe informations"))
        recipe.append(NSLocalizedString("Nom", comment: "Recipe name"))
        recipe.append(NSLocalizedString("Description", comment: "Recipe describe"))
        recipe.append(NSLocalizedString("Difficulté", comment: "Recipe difficulty"))
        recipe.append(NSLocalizedString("Image", comment: "Recipe picture"))
        recipe.append(NSLocalizedString("Ingredients", comment: "Ingredients informations"))

        
        self.recipeTableview.register(UINib(nibName: "TextFieldTableViewCell", bundle:nil), forCellReuseIdentifier: AddRecipeViewController.textCellIdentifier)
        self.recipeTableview.register(UINib(nibName: "ImageTableViewCell", bundle:nil), forCellReuseIdentifier: AddRecipeViewController.imageCellIdentifier)
        self.recipeTableview.register(UINib(nibName:"SectionTableViewCell", bundle: nil), forCellReuseIdentifier: AddRecipeViewController.sectionCellIdentifier)
        self.recipeTableview.register(UINib(nibName:"IngredientTableViewCell", bundle: nil), forCellReuseIdentifier: AddRecipeViewController.ingredientCellIdentifier)
        self.recipeTableview.register(UINib(nibName:"StepTableViewCell", bundle: nil), forCellReuseIdentifier: AddRecipeViewController.stepCellIdentifier)
        
        self.recipeTableview.rowHeight = UITableViewAutomaticDimension
        self.recipeTableview.estimatedRowHeight = 500
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
            if indexPath.row == 3 {
                let cell = recipeTableview.dequeueReusableCell(withIdentifier: AddRecipeViewController.imageCellIdentifier) as? ImageTableViewCell ?? ImageTableViewCell(style:.default, reuseIdentifier: AddRecipeViewController.imageCellIdentifier)
                cell.recipeImage.image =  #imageLiteral(resourceName: "recipe_picture")
                return cell
            } else if self.recipe[indexPath.row] == "Recette" || self.recipe[indexPath.row] == "Ingredients" ||
                self.recipe[indexPath.row] == "Etapes" {
                let cell =  recipeTableview.dequeueReusableCell(withIdentifier: AddRecipeViewController.sectionCellIdentifier) as? SectionTableViewCell ?? SectionTableViewCell(style:.default, reuseIdentifier: AddRecipeViewController.sectionCellIdentifier)
                
                // Configure the cell...
                
                cell.textLabel?.text = self.recipe[indexPath.row]
                
                return cell
                
            } else {
               let cell = recipeTableview.dequeueReusableCell(withIdentifier: AddRecipeViewController.textCellIdentifier) as? TextFieldTableViewCell ?? TextFieldTableViewCell(style:.default, reuseIdentifier: AddRecipeViewController.textCellIdentifier)
                cell.titleLabel.text = self.recipe[indexPath.row]
                return cell

            }
        }
    
}
