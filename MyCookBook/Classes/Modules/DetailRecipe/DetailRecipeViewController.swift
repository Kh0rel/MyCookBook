//
//  DetailRecipeViewController.swift
//  MyCookBook
//
//  Created by Vincent Durpoix on 23/01/2018.
//  Copyright © 2018 Guillaume Chieb bouares. All rights reserved.
//

import UIKit

class DetailRecipeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableviewConfiguration()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func tableviewConfiguration() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName:"ImageTableViewCell", bundle:nil), forCellReuseIdentifier: ImageTableViewCell.cellIdentifier)
        self.tableView.register(UINib(nibName: "TextFieldTableViewCell", bundle: nil), forCellReuseIdentifier: TextFieldTableViewCell.cellIdentifier)
        self.tableView.register(UINib(nibName: "DifficultyTableViewCell", bundle: nil), forCellReuseIdentifier: DifficultyTableViewCell.cellIdentifier)
        self.tableView.register(UINib(nibName: "ButtonTableViewCell", bundle: nil), forCellReuseIdentifier: ButtonTableViewCell.cellidentifier)
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

extension DetailRecipeViewController: UITableViewDataSource {
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

extension DetailRecipeViewController: UITableViewDelegate{
    
}
