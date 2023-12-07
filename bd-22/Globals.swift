//
//  Colordoku.swift
//  bd-22
//
//  Created by Jonathan Beck on 9/9/23.
//

import Foundation
import SpriteKit
import GameplayKit

public class Globals {
    
    public static var ScreenSize: CGSize = CGSize(width: 0, height: 0)
    
    public static var Transform: CGSize = CGSize(width: 0, height: 0)
    
    public static var Colors:[SKColor] =
        [
            SKColor.blue,
            SKColor.brown,
            SKColor.cyan,
            SKColor.gray,
            SKColor.green,
            SKColor.magenta,
            SKColor.orange,
            SKColor.purple,
            SKColor.red,
            SKColor.yellow
        ]
    
    public static var zPos:ZPositions = ZPositions()
}

public class ZPositions {
    public var Board:CGFloat = 8
    public var BoardDecorations:CGFloat = 16
    public var Pieces:CGFloat = 32
}
