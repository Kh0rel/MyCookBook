//
//  InformationSegmentViewController.swift
//  MyCookBook
//
//  Created by PH5153 MacBook on 16/01/2018.
//  Copyright © 2018 Guillaume Chieb bouares. All rights reserved.
//

import UIKit

protocol InformationSegmentViewInterface: class {
    func showInformationView() -> UIView
    func goToNext() -> String
}


class InformationSegmentViewController: UIViewController {
    
    
    @IBOutlet var informationView: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var describeLabel: UILabel!
    @IBOutlet weak var describeText: UITextView!
    @IBOutlet weak var difficultyLabel: UILabel!
    @IBOutlet weak var difficultyText: UITextField!
    
    
    
    @IBAction func addImage(_ sender: Any) {
    }
    @IBAction func touchNext(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(self.image.image == nil) {
            self.image.image = #imageLiteral(resourceName: "recipe_picture")
        }
        
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

extension InformationSegmentViewController : InformationSegmentViewInterface {
    func showInformationView() -> UIView {
        return self.informationView
    }

    func goToNext() ->String {
        return "Ingredients"
    }
}

