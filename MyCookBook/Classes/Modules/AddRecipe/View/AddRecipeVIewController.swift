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
    
    var presenter: AddRecipeModuleInterface!
    var steps: [Step] = []
    var ingredients: [Ingredient] = []
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableviewConfiguration()
        
        self.title = NSLocalizedString("Ajouter une recette", comment: "Add recipe screen title")
    }
    //4 + 2 (ingredients + steps)
    // name , description, difficulty , image
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter.updateView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.presenter.saveRecipe()
    }
    
    fileprivate func tableviewConfiguration() {
        self.tableview.delegate = self
        self.tableview.dataSource = self
        self.tableview.register(UINib(nibName:"ImageTableViewCell", bundle:nil), forCellReuseIdentifier: ImageTableViewCell.cellIdentifier)
        self.tableview.register(UINib(nibName: "TextFieldTableViewCell", bundle: nil), forCellReuseIdentifier: TextFieldTableViewCell.cellIdentifier)
        self.tableview.register(UINib(nibName: "DifficultyTableViewCell", bundle: nil), forCellReuseIdentifier: DifficultyTableViewCell.cellIdentifier)
        self.tableview.register(UINib(nibName: "ButtonTableViewCell", bundle: nil), forCellReuseIdentifier: ButtonTableViewCell.cellidentifier)
    }
}

//MARK: - UItableview delegate methods

extension AddRecipeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 4:
            let viewController = IngredientsViewController()
            viewController.ingredients = self.ingredients
            viewController.delegate = self
            self.navigationController?.pushViewController(viewController, animated: true)
            break
            //ingredients view controller
        case 5:
            let viewController = StepsViewController()
            viewController.steps = self.steps
            viewController.delegate = self
            self.navigationController?.pushViewController(viewController, animated: true)
            break
        default:
            break
        }
    }
}
//MARK: - UItableview Datasource methods

extension AddRecipeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 100.0
        default:
            return 60
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.cellIdentifier) as? ImageTableViewCell ?? ImageTableViewCell(style: .default, reuseIdentifier: ImageTableViewCell.cellIdentifier)
            cell.delegate = self
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldTableViewCell.cellIdentifier) as? TextFieldTableViewCell ?? TextFieldTableViewCell(style: .default, reuseIdentifier: TextFieldTableViewCell.cellIdentifier)
            cell.titleLabel.text = NSLocalizedString("Nom", comment: "Recipe name")
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldTableViewCell.cellIdentifier) as? TextFieldTableViewCell ?? TextFieldTableViewCell(style: .default, reuseIdentifier: TextFieldTableViewCell.cellIdentifier)
            cell.titleLabel.text = NSLocalizedString("Nom", comment: "Recipe description")
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: DifficultyTableViewCell.cellIdentifier) as? DifficultyTableViewCell ?? DifficultyTableViewCell(style: .default, reuseIdentifier: DifficultyTableViewCell.cellIdentifier)
            return cell
        case 4:
            //ingredient
            let cell = tableView.dequeueReusableCell(withIdentifier: ButtonTableViewCell.cellidentifier) as? ButtonTableViewCell ?? ButtonTableViewCell(style: .default, reuseIdentifier: ButtonTableViewCell.cellidentifier)
            cell.leftTitleLabel.text = NSLocalizedString("Ingrédients", comment: "Recipe ingredient button")
            return cell
            break
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: ButtonTableViewCell.cellidentifier) as? ButtonTableViewCell ?? ButtonTableViewCell(style: .default, reuseIdentifier: ButtonTableViewCell.cellidentifier)
            cell.leftTitleLabel.text = NSLocalizedString("Etapes", comment: "Recipe step button")
            return cell
            break
        default:
            break
            
        }
        return UITableViewCell()
    }
}
//MARK: - Cell delegate methods
extension AddRecipeViewController: ImageTableViewCellDelegate {
    func touchPlusImageButton(completionHandler: (UIImage) -> Void) {
        // handler with library or take picture
    }
    
    
}

extension AddRecipeViewController: StepsViewControllerDelegate {
    func passStepsToRecipeView(steps: [Step]) {
        self.steps = steps
        //self.presenter.setSteps(steps: steps)
        
    }
}

extension AddRecipeViewController: IngredientsViewControllerDelegate {
    func passIngredientsToRecipeView(ingredients: [Ingredient]) {
        self.ingredients = ingredients

    }
}
