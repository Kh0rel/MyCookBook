//
//  AppDelegate.swift
//  MyCookBook
//
//  Created by Guillaume Chieb bouares on 05/12/2017.
//  Copyright © 2017 Guillaume Chieb bouares. All rights reserved.
//

import UIKit
import WatchConnectivity
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
       //self.loadFixtures()
       // self.readFixtures()
        
        RootWireframe().presentTabBarView(in: window!)
       
    
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        self.saveContext()
    }

    func saveContext() {
        if let context = CoreDataManager.shared.objectContext?.viewContext {
            if context.hasChanges {
                do {
                    try context.save()
                } catch {
                    let nserror = error as NSError
                    fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                }
            }
        }
    }

}

// Fixture

extension AppDelegate {
    func loadFixtures() {
        let context = CoreDataManager.shared.objectContext?.viewContext
        
        for i in 0..<10 {
            var recipe = Recipe(context: context!)
            recipe.name = "Test + \(i)"
            recipe.describe = "lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum"
            recipe.difficulty = 4.0
            for y in 0..<5 {
                var ingredient = Ingredient(context: context!)
                ingredient.name = "Ingredient + \(y)"
                ingredient.type = "Kg"
                ingredient.weight = 3.50
                recipe.addToIngredients(ingredient)
            }
            for x in 0..<4 {
                var step = Step(context: context!)
                step.name = "Step + \(x)"
                step.describe = "lorem ipsum lorem ipsum lorem ipsum lorem lorem ipsum lorem ipsum lorem ipsum lorem \(x)"
                step.duration = 15.0
                recipe.addToSteps(step)
            }
        }
        self.saveContext()
        
    }
    
    func readFixtures() {
        let context = CoreDataManager.shared.objectContext
        let request: NSFetchRequest<Recipe> = Recipe.fetchRequest()
        if let recipes = try? request.execute() {
            print(recipes)
        }
        
    }
}
