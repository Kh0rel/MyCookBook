//
//  StepTableViewCell.swift
//  MyCookBook
//
//  Created by Meryl Barantal on 14/01/2018.
//  Copyright © 2018 Guillaume Chieb bouares. All rights reserved.
//

import UIKit


class StepTableViewCell: UITableViewCell {
    
    @IBOutlet weak var stepNumber: UITextField!
    @IBOutlet weak var stepDesrcription: UITextField!
    @IBOutlet weak var stepTime: UITextField!
    
    var step: Step! {
        didSet {
            stepNumber.text = step.name ?? ""
            stepDesrcription.text = step.describe ?? ""
            stepTime.text = "\(step.duration)"
        }
    }
    
    var modifiedStep: Step {
        get {
            step.name = stepNumber.text
            step.describe = stepDesrcription.text
            let formatter = NumberFormatter()
            formatter.generatesDecimalNumbers = true
            step.duration = (stepTime.text as! NSString).doubleValue
            
            return step
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

extension StepTableViewCell: UITextFieldDelegate {
    
}


