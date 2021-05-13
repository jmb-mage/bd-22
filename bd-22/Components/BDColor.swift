//
//  BDColor.swift
//  bd-22
//
//  Created by appleseed on 5/8/21.
//

import Foundation
import SpriteKit

class BDColor {
    static func getMood(mood : CGPoint) -> SKColor {
        return SKColor(red:   CGFloat(arc4random_uniform(255))/255.0,
                       green: CGFloat(arc4random_uniform(255))/255.0 ,
                       blue:  CGFloat(arc4random_uniform(255))/255.0 ,
                       alpha: 1.0)
    }
}
