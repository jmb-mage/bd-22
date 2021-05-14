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

    static let moods: [SKColor] = [
        // normal
        SKColor(red: 1, green: 1, blue: 1, alpha: 1.0),
        // mystery
        SKColor(srgbRed: 95.0/255.0, green: 37.0/255.0, blue: 159.0/255.0, alpha: 1.0),
        // thinking
        SKColor(srgbRed: 155.0/255.0, green: 119.0/255.0, blue: 147.0/255.0, alpha: 1.0),
        // aroused
        SKColor(srgbRed: 200.0/255.0, green: 16.0/255.0, blue: 46.0/255.0, alpha: 1.0),
        // healthy
        SKColor(srgbRed: 4.0/255.0, green: 106.0/255.0, blue: 56.0/255.0, alpha: 1.0),
        // concerned
        SKColor(srgbRed: 213.0/255.0, green: 120.0/255.0, blue: 0.0/255.0, alpha: 1.0),
        // joy
        SKColor(srgbRed: 255.0/255.0, green: 130.0/255.0, blue: 0.0/255.0, alpha: 1.0),
        // calm
        SKColor(srgbRed: 173.0/255.0, green: 220.0/255.0, blue: 45.0/255.0, alpha: 1.0),
        // surprised
        SKColor(srgbRed: 255.0/255.0, green: 205.0/255.0, blue: 0.0/255.0, alpha: 1.0),
        // lively
        SKColor(srgbRed: 215.0/255.0, green: 163.0/255.0, blue: 171.0/255.0, alpha: 1.0),
        // romantic
        SKColor(srgbRed: 255.0/255.0, green: 195.0/255.0, blue: 60.0/255.0, alpha: 1.0),
        // mystical
        SKColor(srgbRed: 184.0/255.0, green: 132.0/255.0, blue: 203.0/255.0, alpha: 1.0),
        // mellow
        SKColor(srgbRed: 21.0/255.0, green: 71.0/255.0, blue: 52.0/255.0, alpha: 1.0),
        // fear
        SKColor(srgbRed: 13.0/255.0, green: 13.0/255.0, blue: 13.0/255.0, alpha: 1.0),
        // worried
        SKColor(srgbRed: 202.0/255.0, green: 231.0/255.0, blue: 143.0/255.0, alpha: 1.0),
        // open
        SKColor(srgbRed: 113.0/255.0, green: 178.0/255.0, blue: 201.0/255.0, alpha: 1.0)
    ]

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
