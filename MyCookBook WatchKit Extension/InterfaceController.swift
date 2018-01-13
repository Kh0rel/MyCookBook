//
//  InterfaceController.swift
//  MyCookBook WatchKit Extension
//
//  Created by Guillaume Chieb bouares on 05/12/2017.
//  Copyright © 2017 Guillaume Chieb bouares. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController{
    
    @IBOutlet var RecipeListTable: WKInterfaceTable!

    var session: WCSession?
    var recipesNames = [String]()
    var recipes = [RecipeWatch]()
    
    func getRecipesList(){
        
        guard (session?.isReachable)! else {
            print("not accessible")
            return
        }
        session?.sendMessage(["get":"recipesList"], replyHandler: { reply in
            //self.recipes = (reply["recipeList"] as? [String])!
            self.recipes = try! JSONDecoder().decode([RecipeWatch].self, from: reply["recipeList"] as! Data)
            for fullRecipe in self.recipes{
                self.recipesNames.append(fullRecipe.name!)
            }
            
            
            
            self.RecipeListTable.setNumberOfRows(self.recipesNames.count, withRowType: "RecipeRowControllerIdentifier")
            for (index, recipe) in self.recipesNames.enumerated() {
                let row = self.RecipeListTable.rowController(at: index) as! ListRecipeRowController
                row.RecipeName.setText(recipe)
            }
        }, errorHandler: { error in
            print("error: \(error)")
        })
        

    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Configure interface objects here.
        if WCSession.isSupported() {
            session = WCSession.default
            session?.delegate = self
            session?.activate()
        }
    
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        self.pushController(withName: "ingredientListController", context: recipes[rowIndex].ingredientsWatch)
    }
   
}

extension InterfaceController: WCSessionDelegate{
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("activation OK")
        getRecipesList()
    }
}
