//
//  IngredientsSegmentViewController.swift
//  MyCookBook
//
//  Created by PH5153 MacBook on 16/01/2018.
//  Copyright © 2018 Guillaume Chieb bouares. All rights reserved.
//

import UIKit

protocol IngredientsSegmentViewInterface: class {
    
}

class IngredientsSegmentViewController: UIViewController {
    
    static let ingredientCellIdentifier = "ingredientIdentifier"
    
    @IBOutlet weak var ingredientsTableview: UITableView!
    
    @IBAction func addIngredient(_ sender: Any) {
    }
    
    
    @IBAction func touchNext(_ sender: Any) {
    }
    
    var ingredients : [Ingredient] = []
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.ingredientsTableview.register(UINib(nibName:"IngredientTableViewCell", bundle: nil), forCellReuseIdentifier: IngredientsSegmentViewController.ingredientCellIdentifier)

        
        self.ingredientsTableview.rowHeight = UITableViewAutomaticDimension
        self.ingredientsTableview.estimatedRowHeight = 500
        self.ingredientsTableview.delegate = self
        self.ingredientsTableview.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension IngredientsSegmentViewController: IngredientsSegmentViewInterface{
    
}

extension IngredientsSegmentViewController: UITableViewDelegate{
    
}

extension IngredientsSegmentViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = ingredientsTableview.dequeueReusableCell(withIdentifier: IngredientsSegmentViewController.ingredientCellIdentifier) as? IngredientTableViewCell ?? IngredientTableViewCell(style:.default, reuseIdentifier: IngredientsSegmentViewController.ingredientCellIdentifier)
            return cell
        
    }
    
}

