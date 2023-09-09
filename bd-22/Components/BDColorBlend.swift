//
//  BDColorBlend.swift
//  bd-22
//
//  Created by Jonathan Beck on 9/2/23.
//

import Foundation
import SpriteKit
import GameplayKit

class BDColorBlend {
    
    func blend(colors: [SKColor]) -> SKColor {
        let numberOfColors = CGFloat(colors.count)
        var (red, green, blue, alpha) = (CGFloat(0), CGFloat(0), CGFloat(0), CGFloat(0))

        let componentsSum = colors.reduce((red: CGFloat(0), green: CGFloat(0), blue: CGFloat(0), alpha: CGFloat())) { temp, color in
            color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
            return (temp.red+red, temp.green + green, temp.blue + blue, temp.alpha+alpha)
        }
        return SKColor(red: componentsSum.red / numberOfColors,
                           green: componentsSum.green / numberOfColors,
                           blue: componentsSum.blue / numberOfColors,
                           alpha: componentsSum.alpha / numberOfColors)
    }
}
