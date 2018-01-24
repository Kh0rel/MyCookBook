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
    
    public var objectContext: NSPersistentContainer?
    
    private override init(){
        if let modelURL = Bundle.main.url(forResource: "MyCookBook", withExtension: "momd"){
            if let model = NSManagedObjectModel(contentsOf: modelURL){
                let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: model)
                _ = try? persistentStoreCoordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: FileManager.documentURL(childpath: "MyCookBook.db"), options: nil)
                let container = NSPersistentContainer(name: "MyCookBook")
                container.loadPersistentStores(completionHandler: { (storeDescription, error) in
                    if let error = error as NSError? {
                        fatalError("Unresolved error \(error), \(error.userInfo)")
                    }
                })
                self.objectContext = container
            }
            
        }
        
    }
}
