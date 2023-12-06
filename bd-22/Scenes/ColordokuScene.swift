//
//  ColordokuScene.swift
//  bd-22
//
//  Created by Jonathan Beck on 12/6/23.
//

import Foundation
import SpriteKit
import GameplayKit

class ColordokuScene : SceneProtocol {
    private var screenSize: CGSize = CGSize(width: 0, height: 0)
    private var offset: CGPoint = CGPoint(x: 0, y: 0)
    private var nodesX: Int = 0
    private var nodesY: Int = 0
    private var shapeManager: BDShapeManager = BDShapeManager()
    var cells:[[BDCell]] = []
    
    func Load(scene: SKScene, size:CGSize) {
        self.screenSize = size
        self.offset = CGPoint(x:-BDNode.width * 4, y:BDNode.height * 4)  // CGPoint(x: -size.width / 5, y: -size.height / 5)
        self.nodesX = 9
        self.nodesY = 9
        BDMood.load()
        shapeManager.load(jsonFile: "Sudoku")
        let shape = shapeManager.get(id:0)

        let width = Int(BDNode.width)
        for nodesY in 0...self.nodesY-1 {
            cells.append([])
            for nodesX in 0...self.nodesX-1 {
                let shapeValue = shape[nodesY][nodesX]
                let pos = CGPoint(x: nodesX * width + Int(self.offset.x), y: -nodesY * width + Int(self.offset.y))
                cells[nodesY].append(BDCell(scene: scene, pos: pos, id: shapeValue))
            }
        }
    }
    
    func Update(nodes:[SKNode]) {
        for child in nodes {
            if let node = child as? BDNode {
                node.update()
            }
        }
    }
}
