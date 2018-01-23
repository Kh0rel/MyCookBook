//
//  CoreDataManager.swift
//  MyCookBook
//
//  Created by Guillaume Chieb bouares on 11/12/2017.
//  Copyright © 2017 Guillaume Chieb bouares. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager: NSObject {
    
    public static let shared = CoreDataManager()
    
    public var objectContext: NSManagedObjectContext?
    
    private override init(){
        if let modelURL = Bundle.main.url(forResource: "MyCookBook", withExtension: "momd"){
            if let model = NSManagedObjectModel(contentsOf: modelURL){
                let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: model)
                _ = try? persistentStoreCoordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: FileManager.documentURL(childpath: "MyCookBook.db"), options: nil)
                let context = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
                context.persistentStoreCoordinator = persistentStoreCoordinator
                self.objectContext = context
            }
            
        }
        
    }
    
    public func getStepByRecipeName(recipeName: String) -> [Step] {
        var stepArray: [Step] = []
        if let context = self.objectContext {
            let request: NSFetchRequest<Step> = Step.fetchRequest()
            if let steps = try? context.fetch(request) {
                for step in steps {
                    if step.recipe?.name == recipeName {
                        stepArray.append(step)
                    }
                }
            }
        }
        return stepArray
    }
    
}
