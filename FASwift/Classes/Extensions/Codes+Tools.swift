//
//  Codes+Tools.swift
//  FASwift
//
//  Created by Ondrej Rafaj on 14/10/2017.
//  Copyright © 2017 manGoweb UK. All rights reserved.
//

import Foundation


extension Codes {
    
    public static func fromCode(_ code: String) -> Codes? {
        guard let icon = Codes(rawValue: code) else {
            return nil
        }
        return icon
    }
    
    public var code: String {
        return rawValue
    }
    
}
