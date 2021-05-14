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

    func start(size: CGSize) {
        self.screenSize = size
        self.offset = CGPoint(x: -size.width / 4, y: -size.height / 4)
        self.nodesX = Int(size.width / BDNode.width)
        self.nodesY = Int(size.height / BDNode.height)

        let halfWidth = Int(BDNode.width / 2)
        for nodesY in 0...self.nodesY {
            for nodesX in 0...self.nodesX {
                let pos = CGPoint(x: nodesX * halfWidth + Int(self.offset.x), y: nodesY * halfWidth + Int(self.offset.y))
                self.addChild(BDNode(pos: pos))
            }
        }
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
}
