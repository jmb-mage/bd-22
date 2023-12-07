//
//  GameScene.swift
//  bd-22
//
//  Created by appleseed on 5/8/21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

    private var sceneProvider: SceneProvider = SceneProvider();
    private var currentScene: SceneProtocol? = nil;
    
    func start(size: CGSize) {
        Globals.ScreenSize = size;
        currentScene = sceneProvider.next();
        currentScene!.Load(scene: self);
    }
    
    override func update(_ currentTime: TimeInterval) {
        currentScene!.Update(nodes: self.children)
    }
    
    override func mouseDown(with event: NSEvent) {
        let location = event.location(in: self)
        let touchedNodes = nodes(at: location)
        currentScene!.MouseDown(pos: location, touchedNodes: touchedNodes)
    }
    
    override var isUserInteractionEnabled: Bool {
        get { return true }
        set { }
    }
    
    /*
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
*/
}
