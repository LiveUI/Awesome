//
//  Type+Tools.swift
//  FASwift
//
//  Created by Ondrej Rafaj on 14/10/2017.
//  Copyright © 2017 manGoweb UK. All rights reserved.
//

import Foundation


extension Type {
    
    public static func fromType(_ code: String) -> Type? {
        guard let icon = Type(rawValue: code) else {
            return nil
        }
        return icon
    }
    
    public var code: String {
        return rawValue
    }
    
    public var name: String {
        let index = Type.all().index(of: self)!
        let name = Type.cssCodes()[index]
        return name
    }
    
}
