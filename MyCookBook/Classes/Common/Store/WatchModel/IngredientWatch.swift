//
//  File.swift
//  MyCookBook
//
//  Created by Vincent Durpoix on 13/01/2018.
//  Copyright © 2018 Guillaume Chieb bouares. All rights reserved.
//

import Foundation

class IngredientWatch: Codable {
    var name: String?
    var type: String?
    var weight: Double


    
    init(name: String?,type:String?,weight:Double) {
        self.name = name
        self.type = type
        self.weight = weight
    }
}
