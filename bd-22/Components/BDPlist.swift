//
//  BDPlist.swift
//  bd-22
//
//  Created by appleseed on 5/14/21.
//

import Foundation

class BDPlist {

    static var plist: NSDictionary?

    static func getDictionary(key: String) -> NSDictionary {
        guard let dictionary = Bundle.main.object(forInfoDictionaryKey: key) as? NSDictionary else {
            print("can not open plist dictionary")
            return NSDictionary()
        }
        return dictionary
    }

}
