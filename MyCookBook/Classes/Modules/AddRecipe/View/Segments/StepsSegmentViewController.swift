//
//  StepsSegmentViewController.swift
//  MyCookBook
//
//  Created by PH5153 MacBook on 16/01/2018.
//  Copyright © 2018 Guillaume Chieb bouares. All rights reserved.
//

import UIKit

protocol StepsSegmentViewInterface: class {
    
}

class StepsSegmentViewController: UIViewController {
    
    static let stepCellIdentifier = "stepIdentifier"
    
    
    var steps : [Step] = []
    
    @IBOutlet weak var stepsTableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.stepsTableview.register(UINib(nibName:"StepTableViewCell", bundle: nil), forCellReuseIdentifier: StepsSegmentViewController.stepCellIdentifier)
        
        
        self.stepsTableview.rowHeight = UITableViewAutomaticDimension
        self.stepsTableview.estimatedRowHeight = 500
        self.stepsTableview.delegate = self
        self.stepsTableview.dataSource = self
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

extension StepsSegmentViewController: StepsSegmentViewInterface{
    
}

extension StepsSegmentViewController: UITableViewDelegate{
    
}

extension StepsSegmentViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.steps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = stepsTableview.dequeueReusableCell(withIdentifier: StepsSegmentViewController.stepCellIdentifier) as? StepTableViewCell ?? StepTableViewCell(style:.default, reuseIdentifier: StepsSegmentViewController.stepCellIdentifier)
        return cell
        
    }
    
}

