//
//  BDMood.swift
//  bd-22
//
//  Created by appleseed on 5/8/21.
//

import Foundation
import SpriteKit

class BDMood {

    static let moodCount = 16

    static let normal = 0
    static let mystery = 1
    static let thinking = 2
    static let aroused = 3
    static let healthy = 4
    static let concerned = 5
    static let joy = 6
    static let calm = 7
    static let surprised = 8
    static let lively = 9
    static let romantic = 10
    static let mystical = 11
    static let mellow = 12
    static let fear = 13
    static let worried = 14
    static let open = 15

    static var moods: [SKColor] = []

    static func load() {
        let moodsRGBA = BDPlist.getDictionary(key: "moodsRGBA")
        for mood in moodsRGBA {
            let rgba = String(describing: mood.value).split(separator: ",")
            self.moods.append(SKColor(
                                red: CGFloat.unpack(input: rgba[0]),
                                green: CGFloat.unpack(input: rgba[1]),
                                blue: CGFloat.unpack(input: rgba[2]),
                                alpha: CGFloat.unpack(input: rgba[3])))
        }
    }

    static func getMood(mood: Int) -> SKColor {
        if mood >= 0 && mood < moodCount {
            return self.moods[mood]
        }
        return self.moods[0]
    }

    static func getMoodPoint(mood: CGPoint) -> SKColor {
        return SKColor(red: 1,
                       green: 1 ,
                       blue: 1 ,
                       alpha: 1.0)
    }

    static func getMoodRandom(mood: CGPoint) -> SKColor {
        return SKColor(red: CGFloat(arc4random_uniform(255))/255.0,
                       green: CGFloat(arc4random_uniform(255))/255.0 ,
                       blue: CGFloat(arc4random_uniform(255))/255.0 ,
                       alpha: 1.0)
    }
}
