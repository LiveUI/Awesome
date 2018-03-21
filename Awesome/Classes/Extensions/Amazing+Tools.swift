//
//  Amazing+Tools.swift
//  Awesome
//
//  Created by Ondrej Rafaj on 14/10/2017.
//  Copyright © 2017 manGoweb UK. All rights reserved.
//

import Foundation


public extension Amazing {
    
    public func asImage(size: CGSize, color: Color = Color.black, backgroundColor: Color = Color.clear) -> Image {
        return Image(icon: self, size: size, color: color, backgroundColor: backgroundColor)
    }
    
    public func asImage(size: CGFloat, color: Color = Color.black, backgroundColor: Color = Color.clear) -> Image {
        return Image(icon: self, size: CGSize(width: size, height: size), color: color, backgroundColor: backgroundColor)
    }
    
    public func asAttributedText(fontSize: CGFloat, color: Color = Color.black, backgroundColor: Color = Color.clear) -> NSAttributedString {
        return NSAttributedString.awesome(icon: self, fontSize: fontSize, color: color, backgroundColor: backgroundColor)
    }
    
}


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


