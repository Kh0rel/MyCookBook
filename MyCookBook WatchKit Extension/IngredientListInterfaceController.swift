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
    
    var ingredients : [IngredientWatch]!

    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if let ingre = context as? [IngredientWatch]{
            ingredients = ingre
        }else{
            print("no ingredients")
        }
        
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        self.IngredientListTable.setNumberOfRows(self.ingredients.count, withRowType: "IngredientRowControllerIdentifier")
        for (index, ingredient) in self.ingredients.enumerated() {
            let row = self.IngredientListTable.rowController(at: index) as! ListIngredientRowController
            row.IngredientName.setText(ingredient.name)
        }
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
