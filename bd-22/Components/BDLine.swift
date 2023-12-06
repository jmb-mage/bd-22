//
//  BDLine.swift
//  bd-22
//
//  Created by Jonathan Beck on 12/6/23.
//

import Foundation
import SpriteKit
import GameplayKit

class BDLine {
    private var start:CGPoint;
    private var end:CGPoint;
    private var line:SKShapeNode;
    
    init(start: CGPoint, end: CGPoint) {
        self.start = start
        self.end = end
        var path = CGMutablePath()
        path.move(to: start)
        path.addLine(to: end)
        line = SKShapeNode(path: path)
        line.strokeColor = SKColor.black
    }
    
    func child() -> SKShapeNode  {
        return line
    }
}
