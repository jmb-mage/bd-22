//
//  ViewController.swift
//  bd-22
//
//  Created by appleseed on 5/8/21.
//

import Cocoa
import SpriteKit
import GameplayKit

class ViewController: NSViewController {

    @IBOutlet var skView: SKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let view = self.skView {
            if let scene = GameScene(fileNamed: "GameScene") {
                scene.scaleMode = .aspectFill
                view.presentScene(scene)
                scene.start(size: view.bounds.size)
            }
            
            #if DEBUG
                view.ignoresSiblingOrder = true
                view.showsFPS = true
                view.showsNodeCount = true
            #endif
        }
    }
}

