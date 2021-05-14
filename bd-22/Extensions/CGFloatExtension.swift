//
//  CGFloatExtension.swift
//  bd-22
//
//  Created by appleseed on 5/14/21.
//

import Foundation

extension CGFloat {
    static func unpack(input: Substring) -> CGFloat {
        guard let value = Double(String(input)) else {
            print("error converting string to CGFloat \(input)")
            return 0.0
        }
        return CGFloat(value)
    }
}
