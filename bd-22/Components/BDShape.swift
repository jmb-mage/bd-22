//
//  BDShape.swift
//  bd-22
//
//  Created by appleseed on 5/13/21.
//

import Foundation

class BDShape : Codable {    
    var nodes : [[Int]]
    var name : String
    
    init(intArray: [[Int]], name: String) {
        self.nodes = intArray
        self.name = name
    }
}
