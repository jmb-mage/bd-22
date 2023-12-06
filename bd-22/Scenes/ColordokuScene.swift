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
    private var cells:[[BDCell]] = []
    private var board:[BDLine] = []
    private var scene:SKScene? = nil;
    
    func Load(scene: SKScene, size:CGSize) {
        self.scene = scene
        scene.backgroundColor = NSColor(red: 0, green: 1.0, blue: 0, alpha: 1.0)
        self.screenSize = size
        self.offset = CGPoint(x:-BDNode.width * 4, y:BDNode.height * 4)  // CGPoint(x: -size.width / 5, y: -size.height / 5)
        self.nodesX = 9
        self.nodesY = 9
        BDMood.load()
        shapeManager.load(jsonFile: "Sudoku")
        buildBoard()
        placeAllPieces()
    }
    
    func Update(nodes:[SKNode]) {
        for child in nodes {
            if let node = child as? BDNode {
                node.update()
            }
        }
    }
    
    private func buildBoard() {
        let width = Int(BDNode.width)
        
        // build the board
        for node in 0...self.nodesY-1 {
            let y:Int = Int(self.offset.y)
            let x:Int = Int(self.offset.x) + (node * width)
            let start = CGPoint(x:x, y:y)
            let end = CGPoint(x:x, y:-y)
            let line = BDLine(start: start, end: end)
            scene!.addChild(line.child())
        }
        for node in 0...self.nodesY-1 {
            let y:Int = Int(self.offset.y) + (-node * width)
            let x:Int = Int(self.offset.x)
            let start = CGPoint(x:x, y:y)
            let end = CGPoint(x:-x, y:y)
            let line = BDLine(start: start, end: end)
            scene!.addChild(line.child())
        }
    }
    
    private func placeAllPieces() {
        let shape = shapeManager.get(id:0)
        let width = Int(BDNode.width)
        
        // place all pieces
        for nodesY in 0...self.nodesY-1 {
            cells.append([])
            for nodesX in 0...self.nodesX-1 {
                let shapeValue = shape[nodesY][nodesX]
                let pos = CGPoint(x: nodesX * width + Int(self.offset.x), y: -nodesY * width + Int(self.offset.y))
                cells[nodesY].append(BDCell(scene: self.scene!, pos: pos, id: shapeValue))
            }
        }
    }

}
