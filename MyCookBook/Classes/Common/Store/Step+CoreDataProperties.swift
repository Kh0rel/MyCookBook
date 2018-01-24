//
//  Step+CoreDataProperties.swift
//  
//
//  Created by Guillaume Chieb bouares on 23/01/2018.
//
//

import Foundation
import CoreData


extension Step {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Step> {
        return NSFetchRequest<Step>(entityName: "Step")
    }

    @NSManaged public var describe: String?
    @NSManaged public var duration: Double
    @NSManaged public var name: String?
    @NSManaged public var recipe: Recipe?

}
