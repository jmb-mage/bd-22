//
//  SceneProtocol.swift
//  bd-22
//
//  Created by Jonathan Beck on 12/6/23.
//

import Foundation
import SpriteKit
import GameplayKit

protocol SceneProtocol {
    func Load(scene: SKScene, size:CGSize)
    func Update(nodes:[SKNode])
}
