//
//  GameScene.swift
//  bd-22
//
//  Created by appleseed on 5/8/21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

    private var screenSize: CGSize = CGSize(width: 0, height: 0)
    private var offset: CGPoint = CGPoint(x: 0, y: 0)
    private var nodesX: Int = 0
    private var nodesY: Int = 0
    private var shapeManager: BDShapeManager = BDShapeManager()
    var cells:[[BDCell]] = []

    func start(size: CGSize) {
        ColorDoku()
    }

    func touchDown(atPoint pos: CGPoint) {
        //        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
        //            n.position = pos
        //            n.strokeColor = SKColor.green
        //            self.addChild(n)
        //        }
    }

    func touchMoved(toPoint pos: CGPoint) {
        //        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
        //            n.position = pos
        //            n.strokeColor = SKColor.blue
        //            self.addChild(n)
        //        }
    }

    func touchUp(atPoint pos: CGPoint) {
        //        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
        //            n.position = pos
        //            n.strokeColor = SKColor.red
        //            self.addChild(n)
        //        }
    }

    override func mouseDown(with event: NSEvent) {
        self.touchDown(atPoint: event.location(in: self))
    }

    override func mouseDragged(with event: NSEvent) {
        self.touchMoved(toPoint: event.location(in: self))
    }

    override func mouseUp(with event: NSEvent) {
        self.touchUp(atPoint: event.location(in: self))
    }

    override func keyDown(with event: NSEvent) {
        switch event.keyCode {
        default:
            print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
        }
    }

    override func update(_ currentTime: TimeInterval) {
        for child in self.children {
            if let node = child as? BDNode {
                node.update()
            }
        }
    }
    
    private func ColorDoku() {
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
                cells[nodesY].append(BDCell(scene: self, pos: pos, id: shapeValue))
            }
        }
    }
    
    private func FromJson() {
        self.screenSize = size
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
                self.addChild(BDNode(pos: pos, color: color, isShape: shapeValue >= 1.0))
            }
        }
    }
}
