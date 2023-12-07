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
    private var key:String;
    public static var BDLineZPos:Int = 64
    
    init(start: CGPoint, end: CGPoint, zPos:CGFloat, key:String = "") {
        self.start = start
        self.end = end
        self.key = key
        let path = CGMutablePath()
        path.move(to: start)
        path.addLine(to: end)
        line = SKShapeNode(path: path)
        line.zPosition = zPos
        line.strokeColor = SKColor.black
    }
    
    func child() -> SKShapeNode  {
        return line
    }
}
