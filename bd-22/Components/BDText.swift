//
//  BDText.swift
//  bd-22
//
//  Created by appleseed on 5/8/21.
//

import Foundation
import SpriteKit
import GameplayKit

class BDText: SKLabelNode {
    static var width: CGFloat = 48
    static var height: CGFloat = 48
    static var zPos: CGFloat = 64
    var region : Int = 0
    var node: Int = 0
    var id: CGFloat = 0.0
    
    init(pos: CGPoint, id: CGFloat) {
        super.init()
        let xOffset = 12.0
        self.region = Int(id)
        self.id = id
        self.node = Int(id * 10.0) - Int(self.region * 10)
        let text = "\(self.node)"
        self.zPosition = BDText.zPos
        self.text = text
        self.fontColor = SKColor.white
        self.position = CGPoint(x: pos.x + xOffset, y: pos.y)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func update() {

    }
}
