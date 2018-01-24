//
//  DetailRecipeViewController.swift
//  MyCookBook
//
//  Created by Vincent Durpoix on 23/01/2018.
//  Copyright © 2018 Guillaume Chieb bouares. All rights reserved.
//

import UIKit

protocol DetailRecipeViewInterface: class {
    func showData(recipe:Recipe)
}

class DetailRecipeViewController: UIViewController {
    
    var presenter: DetailRecipeModuleInterface!
    var steps: [Step] = []
    var ingredients: [Ingredient] = []
    var sectionTitle: [String] = [NSLocalizedString("Informations Principales", comment: "Main Informations"),
                                  NSLocalizedString("Détail", comment: "More information")]
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableviewConfiguration()
        
        self.title = self.presenter.getRecipe().name
    }
    //4 + 2 (ingredients + steps)
    // name , description, difficulty , image
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.presenter.showRecipe()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
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

extension DetailRecipeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            if indexPath.row == 0 {
                let viewController = IngredientsViewController()
                viewController.ingredients = self.presenter.getRecipe().ingredients?.allObjects as! [Ingredient]
                self.navigationController?.pushViewController(viewController, animated: true)
            } else {
                let viewController = StepsViewController()
                viewController.steps = self.presenter.getRecipe().steps?.allObjects as! [Step]
                self.navigationController?.pushViewController(viewController, animated: true)
            }
        }
    }
}
//MARK: - UItableview Datasource methods

extension DetailRecipeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitle.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section]
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            if indexPath.section == 0 {
                return 102
            } else {
                return 60
            }
        default:
            return 60
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 4
        default:
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.cellIdentifier) as? ImageTableViewCell ?? ImageTableViewCell(style: .default, reuseIdentifier: ImageTableViewCell.cellIdentifier)
                cell.delegate = self
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldTableViewCell.cellIdentifier) as? TextFieldTableViewCell ?? TextFieldTableViewCell(style: .default, reuseIdentifier: TextFieldTableViewCell.cellIdentifier)
                cell.titleLabel.text = NSLocalizedString("Nom", comment: "Recipe name")
                cell.textField.text = self.presenter.getRecipe().name
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldTableViewCell.cellIdentifier) as? TextFieldTableViewCell ?? TextFieldTableViewCell(style: .default, reuseIdentifier: TextFieldTableViewCell.cellIdentifier)
                cell.titleLabel.text = NSLocalizedString("Description", comment: "Recipe description")
                cell.textField.text = self.presenter.getRecipe().describe
                return cell
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: DifficultyTableViewCell.cellIdentifier) as? DifficultyTableViewCell ?? DifficultyTableViewCell(style: .default, reuseIdentifier: DifficultyTableViewCell.cellIdentifier)
                cell.difficultyRate.rating = self.presenter.getRecipe().difficulty
                return cell
            default:
                break
            }
        } else {
            switch indexPath.row {
            case 0:
                //ingredient
                let cell = tableView.dequeueReusableCell(withIdentifier: ButtonTableViewCell.cellidentifier) as? ButtonTableViewCell ?? ButtonTableViewCell(style: .default, reuseIdentifier: ButtonTableViewCell.cellidentifier)
                cell.leftTitleLabel.text = NSLocalizedString("Ingrédients", comment: "Recipe ingredient button")
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: ButtonTableViewCell.cellidentifier) as? ButtonTableViewCell ?? ButtonTableViewCell(style: .default, reuseIdentifier: ButtonTableViewCell.cellidentifier)
                cell.leftTitleLabel.text = NSLocalizedString("Etapes", comment: "Recipe step button")
                return cell
            default:
                break
            }
        }
        return UITableViewCell()
    }
}
//MARK: - Cell delegate methods
extension DetailRecipeViewController: ImageTableViewCellDelegate {
    func touchPlusImageButton(completionHandler: (UIImage) -> Void) {
        // handler with library or take picture
    }
}


extension DetailRecipeViewController: DetailRecipeViewInterface {
    func showData(recipe: Recipe) {
        //print(tableview.cellForRow(at: IndexPath(row: 0, section: 0)))
        //(tableview.cellForRow(at: IndexPath(row: 1, section: 0)) as! TextFieldTableViewCell).textField.text = recipe.name
        //tableview.cellForRow(at: 1) as DifficultyTableViewCell
    }
    

}

