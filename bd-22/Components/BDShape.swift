//
//  BDShape.swift
//  bd-22
//
//  Created by appleseed on 5/13/21.
//

import Foundation

class BDShape : Codable {    
    var nodes : [[CGFloat]]
    var name : String
    
    init(array: [[CGFloat]], name: String) {
        self.nodes = array
        self.name = name
    }
}
