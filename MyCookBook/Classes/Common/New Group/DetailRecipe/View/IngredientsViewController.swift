//
//  IngredientsViewController.swift
//  MyCookBook
//
//  Created by PH5153 MacBook on 18/01/2018.
//  Copyright © 2018 Guillaume Chieb bouares. All rights reserved.
//

import UIKit

protocol IngredientsViewControllerDelegate {
    func passIngredientsToRecipeView(ingredients: [Ingredient])
}

class IngredientsViewController: UIViewController {
    
    var ingredients: [Ingredient] = []
    var delegate:IngredientsViewControllerDelegate?
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tableview.register(UINib(nibName: "IngredientTableViewCell", bundle: nil), forCellReuseIdentifier: "IngredientTableViewCell")
        self.tableview.dataSource = self
        self.tableview.delegate = self
        self.title = NSLocalizedString("Ingredient", comment: "Ingredient : ADD or Modify")
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "+", style: .plain, target: self, action: #selector(IngredientsViewController.addIngredient))
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        fetchIngredientInCell()
        self.delegate?.passIngredientsToRecipeView(ingredients: ingredients)
    }
    
    @objc func addIngredient() {
        let context = CoreDataManager.shared.objectContext?.viewContext
        ingredients.append(Ingredient(context: context!))
        fetchIngredientInCell()
        tableview.reloadData()
    }
    
    fileprivate func fetchIngredientInCell() {
        for i in 0...ingredients.count {
            if let cell = tableview.cellForRow(at: IndexPath(row: i, section: 0)) as? IngredientTableViewCell {
                ingredients[i] = cell.modifiedIngredient
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension IngredientsViewController: UITableViewDelegate {
    
}

extension IngredientsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130.0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientTableViewCell") as? IngredientTableViewCell ?? IngredientTableViewCell(style: .default, reuseIdentifier: "IngredientTableViewCell")
        cell.ingredient = self.ingredients[indexPath.row]
        return cell
    }
    
    
}
