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
    private var boardLines:[SKShapeNode] = []
    private var boardCells:[[BDNode]] = []
    private var scene:SKScene? = nil;

    func Load(scene: SKScene) {
        self.scene = scene
        scene.backgroundColor = NSColor(red: 0, green: 1.0, blue: 0, alpha: 1.0)
        BDMood.load()
        shapeManager.load(jsonFile: "Sudoku")
        nodeSize = shapeManager.nodeSize()
        boardSize = CGSize(width: nodeSize.x * nodeWidth, height: nodeSize.y * nodeWidth)
        Globals.Transform = CGSize(width: -boardSize.width / 2, height: -boardSize.height / 2)
        drawBoard()
        placeAllPieces()
    }
    
    func Update(nodes:[SKNode]) {
        for child in nodes {
            if let node = child as? BDNode {
                node.update()
            }
        }
    }
    
    func MouseDown(pos:CGPoint, touchedNodes: [SKNode]) {
        let position = BDPoint(x: pos.x, y: pos.y)
        BDLog.Log(msg:"Mouse down \(position.x) \(position.y) touched node count: \(touchedNodes.count)")
    }
    
    private func drawBoard() {
        let zPos:CGFloat = Globals.zPos.Board
        
        for nodesY in 0...nodeSize.y-1 {
            boardCells.append([])
            for nodesX in 0...nodeSize.x-1 {
                let pos = BDPoint(x: nodesX * nodeWidth, y: nodesY * nodeWidth)
                let node = BDNode(pos: pos.ToView(), scalar: 0, zPos:zPos)
                boardCells[nodesY].append(node)
                scene!.addChild(node)
            }
        }
    }
    
    private func drawBoardLines() {
        let zPos = Globals.zPos.BoardDecorations
        
        for node in 0...nodeSize.y {
            let pos:Int = node * nodeWidth
            let start = BDPoint(x:pos, y: 0)
            let end = BDPoint(x:pos, y: Int(boardSize.height))
            let line = BDLine(start: start.ToView(), end: end.ToView(), zPos:zPos, key:"Y")
            let node = line.child()
            boardLines.append(node)
            scene!.addChild(node)
        }
        for node in 0...nodeSize.x {
            let pos:Int = node * nodeWidth
            let start = BDPoint(x:0, y: pos)
            let end = BDPoint(x: Int(boardSize.width), y: pos)
            let line = BDLine(start: start.ToView(), end: end.ToView(), zPos:zPos, key: "X")
            let node = line.child()
            boardLines.append(node)
            scene!.addChild(node)
        }
    }
    
    private func placeAllPieces() {
        let shape = shapeManager.get(id:0)
        let zPos = Globals.zPos.Pieces
        
        for nodesY in 0...nodeSize.y-1 {
            cells.append([])
            for nodesX in 0...nodeSize.x-1 {
                let shapeValue = shape[nodesY][nodesX]
                let pos = BDPoint(x: nodesX * nodeWidth, y: nodesY * nodeWidth)
                cells[nodesY].append(BDCell(scene: self.scene!, pos: pos.ToView(), id: shapeValue, scalar: 4.0, zPos:zPos))
            }
        }
    }

}
