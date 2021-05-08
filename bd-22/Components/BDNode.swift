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
    static var width: Int = 48

    init(pos: CGPoint) {
        super.init()
        let w = CGFloat(BDNode.width)
        let corner = w * 0.3
        let rect = CGRect.init(x: pos.x, y: pos.y, width: w, height: w)
        path = CGPath.init(roundedRect: rect, cornerWidth: corner, cornerHeight: corner, transform: nil)
        self.lineWidth = 2.5
        self.strokeColor = SKColor.green
        self.position = pos
        //self.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
//            self.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
//                                              SKAction.fadeOut(withDuration: 0.5),
//                                              SKAction.removeFromParent()]))
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
    
    


