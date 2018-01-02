//
//  AddRecipeWireframe.swift
//  MyCookBook
//
//  Created by Guillaume Chieb bouares on 02/01/2018.
//  Copyright © 2018 Guillaume Chieb bouares. All rights reserved.
//

import Foundation
import UIKit
protocol AddRecipeWireframeInput: class {
    
}

class AddRecipeWireframe {
    
    weak var viewController: AddRecipeViewController!
    
    public static func assembleModule() -> AddRecipeViewController{
        let viewController = AddRecipeViewController()
        let presenter = AddRecipePresenter()
        let interactor = AddRecipeInteractor()
        let wireframe = AddRecipeWireframe()
        
        viewController.presenter = presenter
        
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        presenter.view = viewController
        
        interactor.output = presenter
        wireframe.viewController = viewController
        
        return viewController
    }
    

}
