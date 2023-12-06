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
    private var nodeWidth:Int = Int(BDNode.width)
    private var boardSize:CGSize = CGSize(width: 0, height: 0)
    private var nodeSize: BDIntSize = BDIntSize()
    private var shapeManager: BDShapeManager = BDShapeManager()
    private var cells:[[BDCell]] = []
    private var board:[BDLine] = []
    private var scene:SKScene? = nil;

    func Load(scene: SKScene) {
        self.scene = scene
        scene.backgroundColor = NSColor(red: 0, green: 1.0, blue: 0, alpha: 1.0)
        BDMood.load()
        shapeManager.load(jsonFile: "Sudoku")
        nodeSize = shapeManager.nodeSize()
        boardSize = CGSize(width: nodeSize.x * nodeWidth, height: nodeSize.y * nodeWidth)
        Globals.Transform = CGSize(width: -boardSize.width / 2, height: -boardSize.height / 2)
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
        for node in 0...nodeSize.y {
            let pos:Int = node * nodeWidth
            let start = BDPoint(x:pos, y: 0)
            let end = BDPoint(x:pos, y: Int(boardSize.height))
            let line = BDLine(start: start.ToView(), end: end.ToView())
            scene!.addChild(line.child())
        }
        for node in 0...nodeSize.x {
            let pos:Int = node * nodeWidth
            let start = BDPoint(x:0, y: pos)
            let end = BDPoint(x: Int(boardSize.width), y: pos)
            let line = BDLine(start: start.ToView(), end: end.ToView())
            scene!.addChild(line.child())
        }
    }
    
    private func placeAllPieces() {
        let shape = shapeManager.get(id:0)
        
        for nodesY in 0...nodeSize.y-1 {
            cells.append([])
            for nodesX in 0...nodeSize.x-1 {
                let shapeValue = shape[nodesY][nodesX]
                let pos = BDPoint(x: nodesX * nodeWidth, y: nodesY * nodeWidth)
                cells[nodesY].append(BDCell(scene: self.scene!, pos: pos.ToView(), id: shapeValue))
            }
        }
    }

}
