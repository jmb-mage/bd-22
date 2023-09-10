//
//  BDCell.swift
//  bd-22
//
//  Created by Jonathan Beck on 9/9/23.
//

import Foundation
import SpriteKit
import GameplayKit

public class BDCell {
    var bdNode:BDNode
    var bdText:BDText
    var region : Int = 0
    var node: Int = 0
    var id: CGFloat = 0.0
    
    public init(scene:SKScene, pos:CGPoint, id: CGFloat) {
        self.region = Int(id)
        self.id = id
        self.node = Int(id * 10.0) - Int(self.region * 10)
        self.bdNode = BDNode(pos: pos, region: self.region, node: self.node)
        self.bdText = BDText(pos: pos, id: id)
        scene.addChild(bdNode)
        scene.addChild(bdText)
    }
}
