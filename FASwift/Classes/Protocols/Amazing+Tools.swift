//
//  Amazing+Tools.swift
//  FASwift
//
//  Created by Ondrej Rafaj on 14/10/2017.
//  Copyright © 2017 manGoweb UK. All rights reserved.
//

import Foundation


extension Awesome.brand {
    
    public typealias AwesomeType = Awesome.brand
    
    public static func fromType(_ code: String) -> AwesomeType? {
        guard let icon = AwesomeType(rawValue: code) else {
            return nil
        }
        return icon
    }
    
    public var name: String {
        let index = AwesomeType.all.index(of: self)!
        let name = AwesomeType.keys[index]
        return name
    }
    
    public var label: String {
        let index = AwesomeType.all.index(of: self)!
        let name = AwesomeType.labels[index]
        return name
    }
    
}

extension Awesome.light {
    
    public typealias AwesomeType = Awesome.light
    
    public static func fromType(_ code: String) -> AwesomeType? {
        guard let icon = AwesomeType(rawValue: code) else {
            return nil
        }
        return icon
    }
    
    public var name: String {
        let index = AwesomeType.all.index(of: self)!
        let name = AwesomeType.keys[index]
        return name
    }
    
    public var label: String {
        let index = AwesomeType.all.index(of: self)!
        let name = AwesomeType.labels[index]
        return name
    }
    
}

extension Awesome.regular {
    
    public typealias AwesomeType = Awesome.regular
    
    public static func fromType(_ code: String) -> AwesomeType? {
        guard let icon = AwesomeType(rawValue: code) else {
            return nil
        }
        return icon
    }
    
    public var name: String {
        let index = AwesomeType.all.index(of: self)!
        let name = AwesomeType.keys[index]
        return name
    }
    
    public var label: String {
        let index = AwesomeType.all.index(of: self)!
        let name = AwesomeType.labels[index]
        return name
    }
    
}

extension Awesome.solid {
    
    public typealias AwesomeType = Awesome.solid
    
    public static func fromType(_ code: String) -> AwesomeType? {
        guard let icon = AwesomeType(rawValue: code) else {
            return nil
        }
        return icon
    }
    
    public var name: String {
        let index = AwesomeType.all.index(of: self)!
        let name = AwesomeType.keys[index]
        return name
    }
    
    public var label: String {
        let index = AwesomeType.all.index(of: self)!
        let name = AwesomeType.labels[index]
        return name
    }
    
}


