//
//  ImageTableViewCell.swift
//  MyCookBook
//
//  Created by Guillaume Chieb bouares on 03/01/2018.
//  Copyright © 2018 Guillaume Chieb bouares. All rights reserved.
//

import UIKit

protocol ImageTableViewCellDelegate {
    func touchPlusImageButton(completionHandler:(_ image:UIImage)-> Void)
}

class ImageTableViewCell: UITableViewCell {

    @IBOutlet weak var recipeImage: UIImageView!
    var delegate: ImageTableViewCellDelegate!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func touchPlusButton(_ sender: Any) {
        delegate.touchPlusImageButton { (result:UIImage) in
            recipeImage.image = result
        }
    }
}
