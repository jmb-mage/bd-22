//
//  JsonScene.swift
//  bd-22
//
//  Created by Jonathan Beck on 12/6/23.
//

import Foundation
import Foundation
import SpriteKit
import GameplayKit

class JsonScene : SceneProtocol {
    private var size: CGSize = CGSize(width: 0, height: 0)
    private var offset: CGPoint = CGPoint(x: 0, y: 0)
    private var nodesX: Int = 0
    private var nodesY: Int = 0
    private var shapeManager: BDShapeManager = BDShapeManager()
    var cells:[[BDCell]] = []
    
    func Load(scene: SKScene) {
        self.size = Globals.ScreenSize
        self.offset = CGPoint(x: -size.width / 4, y: -size.height / 4)
        self.nodesX = Int(size.width / BDNode.width)
        self.nodesY = Int(size.height / BDNode.height)
        print("Nodes are \(self.nodesX) by \(self.nodesY)")

        BDMood.load()
        shapeManager.load(jsonFile: "ShapeAll")
        shapeManager.load(jsonFile: "ShapeDonut")
        let shape = shapeManager.get(id:0)

        let halfWidth = Int(BDNode.width / 2)
        for nodesY in 0...self.nodesY-1 {
            for nodesX in 0...self.nodesX-1 {
                let shapeValue = shape[nodesY][nodesX]
                let color = SKColor(red: 1.0, green: 1.0, blue: 1.0, alpha: shapeValue)
                let pos = CGPoint(x: nodesX * halfWidth + Int(self.offset.x), y: nodesY * halfWidth + Int(self.offset.y))
                scene.addChild(BDNode(pos: pos, color: color, isShape: shapeValue >= 1.0))
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
    
    func MouseDown(pos:CGPoint, touchedNodes: [SKNode]) {
    
    }
}
