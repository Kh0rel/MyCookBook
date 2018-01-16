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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("test")
        self.title = NSLocalizedString("Ajouter une recette", comment: "Add recipe screen title")
        //segmentControl.addSubview(segmentView)
        //segmentControl.addTarget(self, action: #selector(AddRecipeViewController.segmentedValueChanged(_:)), for: .valueChanged)
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
    
    @objc func segmentedValueChanged(_ sender:UISegmentedControl){
        switch sender.selectedSegmentIndex {
        case 0:
            print("ta mere")
        default:
            print("default")
        }
        
    }
    
}


