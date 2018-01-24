//
//  StepsViewController.swift
//  MyCookBook
//
//  Created by PH5153 MacBook on 18/01/2018.
//  Copyright © 2018 Guillaume Chieb bouares. All rights reserved.
//

import UIKit

protocol StepsViewControllerDelegate {
    func passStepsToRecipeView(steps: [Step])
}

class StepsViewController: UIViewController {

    var steps: [Step] = []
    var currentStep: Step?
    var delegate: StepsViewControllerDelegate?
    @IBOutlet weak var tableview: UITableView!
    let timePicker: UIDatePicker = UIDatePicker()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableview.register(UINib(nibName: "StepTableViewCell", bundle: nil), forCellReuseIdentifier: "StepTableViewCell")
        self.tableview.dataSource = self
        self.tableview.delegate = self
        self.title = NSLocalizedString("Etapes", comment: "Step : ADD or Modify")
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "+", style: .plain, target: self, action: #selector(StepsViewController.addStep))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.fetchStepInCell()
        if let delegate = self.delegate {
            delegate.passStepsToRecipeView(steps: steps)
        }
        //pass steps to AddRecipeViewController [delegate]
        
    }
    
    @objc func addStep() {
        let context = CoreDataManager.shared.objectContext?.viewContext
        steps.append(Step(context: context!))
        fetchStepInCell()
        tableview.reloadData()
    }
    
    fileprivate func fetchStepInCell() {
        for i in 0...steps.count {
            if let cell = tableview.cellForRow(at: IndexPath(row: i, section: 0)) as? StepTableViewCell {
                steps[i] = cell.modifiedStep
            }
        }
    }
}

extension StepsViewController: UITableViewDelegate {
    
}

extension StepsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130.0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.steps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StepTableViewCell") as? StepTableViewCell ?? StepTableViewCell(style: .default, reuseIdentifier: "StepTableViewCell")
        cell.step = self.steps[indexPath.row]
        return cell
    }
    
    
}
