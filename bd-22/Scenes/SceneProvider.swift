//
//  SceneProvider.swift
//  bd-22
//
//  Created by Jonathan Beck on 12/6/23.
//

import Foundation
class SceneProvider {
    
    private var scenes: [SceneProtocol]
    
    init() {
        scenes = [];
    }
    
    func next() -> SceneProtocol {
        return ColordokuScene();
    }
}
