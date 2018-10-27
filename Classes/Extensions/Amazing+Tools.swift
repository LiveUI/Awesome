//
//  Amazing+Tools.swift
//  Awesome
//
//  Created by Ondrej Rafaj on 14/10/2017.
//  Copyright © 2017 manGoweb UK. All rights reserved.
//

import Foundation
import CoreGraphics

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

extension Awesome.Brand {
    
    public var code: String {
        return self.rawValue
    }
    
    public var key: String {
        return String(describing: self)
    }
    
    public var description: String {
        return String(describing: self).split(separator: "-").map { $0.firstUppercased }.joined(separator: " ")
    }
    
    public var name: String {
        return self.key
    }
    
    public var label: String {
        return self.description
    }
    
    @available(swift, deprecated: 4.2, message: "This will be removed in the future. Please use .allCases instead")
    public static var all: [Awesome.brand] {
        return allCases
    }
    
    public static var allKeys: [String] {
        return allCases.map { $0.key }
    }
    
    public static var allDescriptions: [String] {
        return allCases.map { $0.description }
    }
    
    public static var keys: [String] {
        return allKeys
    }
    
    public static var labels: [String] {
        return allDescriptions
    }
    
}

extension Awesome.Regular {
    
    public var code: String {
        return self.rawValue
    }
    
    public var key: String {
        return String(describing: self)
    }
    
    public var description: String {
        return String(describing: self).split(separator: "-").map { $0.firstUppercased }.joined(separator: " ")
    }
    
    public var name: String {
        return self.key
    }
    
    public var label: String {
        return self.description
    }
    
    @available(swift, deprecated: 4.2, message: "This will be removed in the future. Please use .allCases instead")
    public static var all: [Awesome.regular] {
        return allCases
    }
    
    public static var allKeys: [String] {
        return allCases.map { $0.key }
    }
    
    public static var allDescriptions: [String] {
        return allCases.map { $0.description }
    }
    
    public static var keys: [String] {
        return allKeys
    }
    
    public static var labels: [String] {
        return allDescriptions
    }
    
}

extension Awesome.Solid {
    
    public var code: String {
        return self.rawValue
    }
    
    public var key: String {
        return String(describing: self)
    }
    
    public var description: String {
        return String(describing: self).split(separator: "-").map { $0.firstUppercased }.joined(separator: " ")
    }
    
    public var name: String {
        return self.key
    }
    
    public var label: String {
        return self.description
    }
    
    @available(swift, deprecated: 4.2, message: "This will be removed in the future. Please use .allCases instead")
    public static var all: [Awesome.solid] {
        return allCases
    }
    
    public static var allKeys: [String] {
        return allCases.map { $0.key }
    }
    
    public static var allDescriptions: [String] {
        return allCases.map { $0.description }
    }
    
    public static var keys: [String] {
        return allKeys
    }
    
    public static var labels: [String] {
        return allDescriptions
    }
    
}

extension AwesomePro.Brand {
    
    public var code: String {
        return self.rawValue
    }
    
    public var key: String {
        return String(describing: self)
    }
    
    public var description: String {
        return String(describing: self).split(separator: "-").map { $0.firstUppercased }.joined(separator: " ")
    }
    
    public var name: String {
        return self.key
    }
    
    public var label: String {
        return self.description
    }
    
    @available(swift, deprecated: 4.2, message: "This will be removed in the future. Please use .allCases instead")
    public static var all: [AwesomePro.brand] {
        return allCases
    }
    
    public static var allKeys: [String] {
        return allCases.map { $0.key }
    }
    
    public static var allDescriptions: [String] {
        return allCases.map { $0.description }
    }
    
    public static var keys: [String] {
        return allKeys
    }
    
    public static var labels: [String] {
        return allDescriptions
    }
    
}

extension AwesomePro.Regular {
    
    public var code: String {
        return self.rawValue
    }
    
    public var key: String {
        return String(describing: self)
    }
    
    public var description: String {
        return String(describing: self).split(separator: "-").map { $0.firstUppercased }.joined(separator: " ")
    }
    
    public var name: String {
        return self.key
    }
    
    public var label: String {
        return self.description
    }
    
    @available(swift, deprecated: 4.2, message: "This will be removed in the future. Please use .allCases instead")
    public static var all: [AwesomePro.regular] {
        return allCases
    }
    
    public static var allKeys: [String] {
        return allCases.map { $0.key }
    }
    
    public static var allDescriptions: [String] {
        return allCases.map { $0.description }
    }
    
    public static var keys: [String] {
        return allKeys
    }
    
    public static var labels: [String] {
        return allDescriptions
    }
    
}

extension AwesomePro.Solid {
    
    public var code: String {
        return self.rawValue
    }
    
    public var key: String {
        return String(describing: self)
    }
    
    public var description: String {
        return String(describing: self).split(separator: "-").map { $0.firstUppercased }.joined(separator: " ")
    }
    
    public var name: String {
        return self.key
    }
    
    public var label: String {
        return self.description
    }
    
    @available(swift, deprecated: 4.2, message: "This will be removed in the future. Please use .allCases instead")
    public static var all: [AwesomePro.solid] {
        return allCases
    }
    
    public static var allKeys: [String] {
        return allCases.map { $0.key }
    }
    
    public static var allDescriptions: [String] {
        return allCases.map { $0.description }
    }
    
    public static var keys: [String] {
        return allKeys
    }
    
    public static var labels: [String] {
        return allDescriptions
    }
    
}

extension AwesomePro.Light {
    
    public var code: String {
        return self.rawValue
    }
    
    public var key: String {
        return String(describing: self)
    }
    
    public var description: String {
        return String(describing: self).split(separator: "-").map { $0.firstUppercased }.joined(separator: " ")
    }

    public var name: String {
        return self.key
    }
    
    public var label: String {
        return self.description
    }

    @available(swift, deprecated: 4.2, message: "This will be removed in the future. Please use .allCases instead")
    public static var all: [AwesomePro.light] {
        return allCases
    }
    
    public static var allKeys: [String] {
        return allCases.map { $0.key }
    }

    public static var allDescriptions: [String] {
        return allCases.map { $0.description }
    }

    public static var keys: [String] {
        return allKeys
    }

    public static var labels: [String] {
        return allDescriptions
    }

}
