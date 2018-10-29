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
    
    /// Returns an image with the selected icon
    ///
    /// - Parameters:
    ///   - size: the size of the returned image
    ///   - color: the foreground color of the icon
    ///   - backgroundColor: the background color of the icon
    /// - Returns: an image that contains the selected icon
    public func asImage(size: CGSize, color: Color = Color.black, backgroundColor: Color = Color.clear) -> Image {
        return Image(icon: self, size: size, color: color, backgroundColor: backgroundColor)
    }
    
    /// Returns a square image with the selected icon
    ///
    /// - Parameters:
    ///   - size: the height and width of the returned image
    ///   - color: the foreground color of the icon
    ///   - backgroundColor: the background color of the icon
    /// - Returns: a square image that contains the selected icon
    public func asImage(size: CGFloat, color: Color = Color.black, backgroundColor: Color = Color.clear) -> Image {
        return Image(icon: self, size: CGSize(width: size, height: size), color: color, backgroundColor: backgroundColor)
    }
    
    /// Returns an attributed string with the selected icon
    ///
    /// - Parameters:
    ///   - fontSize: the size of the font used in the string
    ///   - color: the foreground color of the selected icon
    ///   - backgroundColor: the background color of the selected icon
    /// - Returns: an attributed string that contains the selected icon
    public func asAttributedText(fontSize: CGFloat, color: Color = Color.black, backgroundColor: Color = Color.clear) -> NSAttributedString {
        return NSAttributedString(icon: self, fontSize: fontSize, color: color, backgroundColor: backgroundColor)
    }
    
}

extension Amazing {
    
    public var detailedKey: String {
        return String(reflecting: self)
            .split(separator: ".")
            .suffix(3)
            .map { String($0).camelCaseToString(with: "-").lowercased() }
            .joined(separator: ".")
    }
    
    public var key: String {
        return String(describing: self).lowercased()
    }
    
    public var description: String {
        return String(describing: self).camelCaseToString()
    }
    
    public static var allKeys: [String] {
        return allCases.map { $0.key }
    }

    public static var allDetailedKeys: [String] {
        return allCases.map { $0.detailedKey }
    }
    
    public static var allDescriptions: [String] {
        return allCases.map { $0.description }
    }
    
    @available(swift, deprecated: 4.2, message: "This will be removed in the future. Please use .allKeys instead")
    public static var keys: [String] {
        return allKeys
    }
    
    @available(swift, deprecated: 4.2, message: "This will be removed in the future. Please use .allDescriptions instead")
    public static var labels: [String] {
        return allDescriptions
    }
    
    @available(swift, deprecated: 4.2, message: "This will be removed in the future. Please use .rawValue instead.")
    public var code: String {
        return self.rawValue
    }
    
    @available(swift, deprecated: 4.2, message: "This will be removed in the future. Please use .key or .detailedKey instead.")
    public var name: String {
        return String(describing: self).camelCaseToString(with: "-").lowercased()
    }
    
    @available(swift, deprecated: 4.2, message: "This will be removed in the future. Please use .description instead.")
    public var label: String {
        return self.description
    }
    
}

extension Awesome {
    @available(*, deprecated, renamed: "Brand")
    public typealias brand = Awesome.Brand
    
    @available(*, deprecated, renamed: "Regular")
    public typealias regular = Awesome.Regular
    
    @available(*, deprecated, renamed: "Solid")
    public typealias solid = Awesome.Solid
}

extension AwesomePro {
    @available(*, deprecated, renamed: "Brand")
    public typealias brand = AwesomePro.Brand
    
    @available(*, deprecated, renamed: "Regular")
    public typealias regular = AwesomePro.Regular
    
    @available(*, deprecated, renamed: "Solid")
    public typealias solid = AwesomePro.Solid
    
    @available(*, deprecated, renamed: "Light")
    public typealias light = AwesomePro.Light
}

extension Awesome.Brand {
    
    @available(swift, deprecated: 4.2, message: "This will be removed in the future. Please use .allCases instead")
    public static var all: [Awesome.brand] {
        return allCases
    }
        
}

extension Awesome.Regular {
    
    @available(swift, deprecated: 4.2, message: "This will be removed in the future. Please use .allCases instead")
    public static var all: [Awesome.regular] {
        return allCases
    }
    
}

extension Awesome.Solid {
    
    @available(swift, deprecated: 4.2, message: "This will be removed in the future. Please use .allCases instead")
    public static var all: [Awesome.solid] {
        return allCases
    }
    
}

extension AwesomePro.Brand {
    
    @available(swift, deprecated: 4.2, message: "This will be removed in the future. Please use .allCases instead")
    public static var all: [AwesomePro.brand] {
        return allCases
    }
    
}

extension AwesomePro.Regular {
    
    @available(swift, deprecated: 4.2, message: "This will be removed in the future. Please use .allCases instead")
    public static var all: [AwesomePro.regular] {
        return allCases
    }
    
}

extension AwesomePro.Solid {
    
    @available(swift, deprecated: 4.2, message: "This will be removed in the future. Please use .allCases instead")
    public static var all: [AwesomePro.solid] {
        return allCases
    }
    
}

extension AwesomePro.Light {
    
    @available(swift, deprecated: 4.2, message: "This will be removed in the future. Please use .allCases instead")
    public static var all: [AwesomePro.light] {
        return allCases
    }
    
}
