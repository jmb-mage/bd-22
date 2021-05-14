//
//  BDAnimateColor.swift
//  bd-22
//
//  Created by appleseed on 5/13/21.
//

import Foundation
import SpriteKit

func lerp(start : CGFloat, end : CGFloat, fraction : CGFloat) -> CGFloat
{
    return (end-start) * fraction + start
}

struct ColorComponents {
    var red = CGFloat(0)
    var green = CGFloat(0)
    var blue = CGFloat(0)
    var alpha = CGFloat(0)
}

extension SKColor {
    func toComponents() -> ColorComponents {
        var components = ColorComponents()
        getRed(&components.red, green: &components.green, blue: &components.blue, alpha: &components.alpha)
        return components
    }
}

extension SKAction {
    static func BDAnimateColor(fromColor : SKColor, toColor : SKColor, duration : Double = 0.4) -> SKAction
    {
        return SKAction.customAction(withDuration: duration, actionBlock: { (node : SKNode!, elapsedTime : CGFloat) -> Void in
            let fraction = CGFloat(elapsedTime / CGFloat(duration))
            let startColorComponents = fromColor.toComponents()
            let endColorComponents = toColor.toComponents()
            let transColor = SKColor(red: lerp(start: startColorComponents.red, end: endColorComponents.red, fraction: fraction),
                                     green: lerp(start: startColorComponents.green, end: endColorComponents.green, fraction: fraction),
                                     blue: lerp(start: startColorComponents.blue, end: endColorComponents.blue, fraction: fraction),
                                     alpha: lerp(start: startColorComponents.alpha, end: endColorComponents.alpha, fraction: fraction))
            (node as? SKShapeNode)?.fillColor = transColor
        }
        )
    }
}
