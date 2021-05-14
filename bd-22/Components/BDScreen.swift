//
//  BDScreen.swift
//  bd-22
//
//  Created by appleseed on 5/13/21.
//

import Cocoa
import SpriteKit
import GameplayKit

class BDScreen {
    static func getWindowSize(scene: SKScene) -> CGRect {
        if let rect = scene.view?.frame {
            return rect
        }
        if let bounds = scene.view?.bounds {
            return bounds
        }

        return CGRect(x: 0, y: 0, width: 0, height: 0)
    }
}
