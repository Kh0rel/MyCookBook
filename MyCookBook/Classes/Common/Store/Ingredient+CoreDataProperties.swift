//
//  Ingredient+CoreDataProperties.swift
//  
//
//  Created by Guillaume Chieb bouares on 23/01/2018.
//
//

import Foundation
import CoreData


extension Ingredient {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ingredient> {
        return NSFetchRequest<Ingredient>(entityName: "Ingredient")
    }

    @NSManaged public var name: String?
    @NSManaged public var type: String?
    @NSManaged public var weight: Double
    @NSManaged public var recipe: Recipe?

}
