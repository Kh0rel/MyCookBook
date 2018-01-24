//
//  DetailRecipeWireframe.swift
//  MyCookBook
//
//  Created by Vincent Durpoix on 23/01/2018.
//  Copyright © 2018 Guillaume Chieb bouares. All rights reserved.
//

import UIKit


class DetailRecipeWireframe: NSObject {
    weak var detailRecipeViewController: DetailRecipeViewController!
    
    public static func assembleModule(recipe:Recipe) -> UIViewController {
        let view = DetailRecipeViewController()
        let presenter = DetailRecipePresenter(recipe: recipe)
        let interactor = DetailRecipeInteractor()
        let wireframe = DetailRecipeWireframe()
        
        
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        presenter.view = view
        
        interactor.output = presenter
        wireframe.detailRecipeViewController = view
        
        return wireframe.detailRecipeViewController
    }
    
}

