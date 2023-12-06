//
//  BDPoint.swift
//  bd-22
//
//  Created by Jonathan Beck on 12/6/23.
//

import Foundation
class BDPoint {
    public var x:Int;
    public var y:Int;
    
    init() {
        x = 0
        y = 0
    }
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    public func ToCGPoint() -> CGPoint {
        return CGPoint(x:x, y:y)
    }
    
    public func ToView() -> CGPoint {
        return CGPoint(x:x + Int(Globals.Transform.width), y:y + Int(Globals.Transform.height))
    }
}
