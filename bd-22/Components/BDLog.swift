//
//  BDLog.swift
//  bd-22
//
//  Created by Jonathan Beck on 12/6/23.
//

import Foundation
class BDLog {
    
    static func Log(msg:String) {
        #if DEBUG
        print(msg)
        #endif
    }
}
