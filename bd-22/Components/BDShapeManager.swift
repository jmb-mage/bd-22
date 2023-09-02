//
//  Pattern.swift
//  bd-22
//
//  Created by Jonathan Beck on 9/2/23.
//

import Foundation
class BDShapeManager {

    var shapes: [BDShape] = []
    
    init() {
    }

    func get(shapeId: Int) -> [[Int]] {
        switch shapeId {
        default:
            return shapes[0].nodes
        }
    }

    func add(shapeArray: BDShape) {
        shapes.append(shapeArray)
    }

    func load(jsonFile: String) {
        if let path = Bundle.main.path(forResource: jsonFile, ofType: "json") {
            do
            {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let shape = try JSONDecoder().decode(BDShape.self, from:data)
                self.add(shapeArray: shape)
              } catch {
                   print("Erroring loading " + jsonFile)
              }
        } else {
            print("Can not find file " + jsonFile)
        }

    }
}
