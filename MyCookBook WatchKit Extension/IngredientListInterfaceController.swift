//
//  IngredientListInterfaceController.swift
//  MyCookBook WatchKit Extension
//
//  Created by Vincent Durpoix on 13/01/2018.
//  Copyright © 2018 Guillaume Chieb bouares. All rights reserved.
//

import WatchKit
import Foundation


class IngredientListInterfaceController: WKInterfaceController {

    @IBOutlet var IngredientListTable: WKInterfaceTable!
    
    var ingredients = [IngredientWatch]()

    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
