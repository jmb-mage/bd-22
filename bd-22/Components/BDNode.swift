//
//  BDNode.swift
//  bd-22
//
//  Created by appleseed on 5/8/21.
//

import Foundation
import SpriteKit
import GameplayKit

class BDNode: SKShapeNode {
    static var width: CGFloat = 48
    static var height: CGFloat = 48
    var mood: CGPoint = CGPoint(x: 0, y: 0)
    var moodV: Double = 5
    var isMoodAnimating: Bool = false
    var taskId: Int = 0
    var isShapeNode: Bool = true
    
    // Init

    init(pos: CGPoint) {
        #if DEBUG
        print("Adding BDNode \(pos.x) \(pos.y)")
        #endif
        super.init()
        let width = CGFloat(BDNode.width)
        let corner = width * 0.3
        let rect = CGRect.init(x: pos.x, y: pos.y, width: width, height: width)
        path = CGPath.init(roundedRect: rect, cornerWidth: corner, cornerHeight: corner, transform: nil)
        self.lineWidth = 2.5
        self.strokeColor = SKColor.green
        self.fillColor = BDMood.getMoodPoint(mood: self.mood)
        self.position = pos
        self.isShapeNode = true
    }
    
    init(pos: CGPoint, color: SKColor) {
        #if DEBUG
        print("Adding BDNode \(pos.x) \(pos.y) \(color)")
        #endif
        super.init()
        let width = CGFloat(BDNode.width)
        let corner = width * 0.3
        let rect = CGRect.init(x: pos.x, y: pos.y, width: width, height: width)
        path = CGPath.init(roundedRect: rect, cornerWidth: corner, cornerHeight: corner, transform: nil)
        self.lineWidth = 2.5
        self.strokeColor = SKColor.green
        self.fillColor = color
        self.position = pos
    }
    
    init(pos: CGPoint, color: SKColor, isShape: Bool) {
        #if DEBUG
        print("Adding BDNode \(pos.x) \(pos.y) \(color)")
        #endif
        super.init()
        let width = CGFloat(BDNode.width)
        let corner = width * 0.3
        let rect = CGRect.init(x: pos.x, y: pos.y, width: width, height: width)
        if isShape == true {
            path = CGPath.init(roundedRect: rect, cornerWidth: corner, cornerHeight: corner, transform: nil)
            self.lineWidth = 2.5
            self.strokeColor = SKColor.green
        }
        self.fillColor = color
        self.position = pos
        self.isShapeNode = isShape
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func update() {
        if self.isMoodAnimating == false && self.isShapeNode == true {
            self.isMoodAnimating = true
            self.run(SKAction.BDAnimateColor(
                        fromColor: self.fillColor,
                        toColor: BDMood.getMood(mood: Int(arc4random_uniform(16))),
                        duration: self.moodV),
                     completion: {() -> Void in
                        self.isMoodAnimating = false
                     })
        }
    }
}
