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
    func asImage(size: CGSize, color: Color = Color.black, backgroundColor: Color = Color.clear) -> Image {
        return Image(icon: self, size: size, color: color, backgroundColor: backgroundColor)
    }
    
    /// Returns a square image with the selected icon
    ///
    /// - Parameters:
    ///   - size: the height and width of the returned image
    ///   - color: the foreground color of the icon
    ///   - backgroundColor: the background color of the icon
    /// - Returns: a square image that contains the selected icon
    func asImage(size: CGFloat, color: Color = Color.black, backgroundColor: Color = Color.clear) -> Image {
        return Image(icon: self, size: CGSize(width: size, height: size), color: color, backgroundColor: backgroundColor)
    }
    
    /// Returns an attributed string with the selected icon
    ///
    /// - Parameters:
    ///   - fontSize: the size of the font used in the string
    ///   - color: the foreground color of the selected icon
    ///   - backgroundColor: the background color of the selected icon
    /// - Returns: an attributed string that contains the selected icon
    func asAttributedText(fontSize: CGFloat, color: Color = Color.black, backgroundColor: Color = Color.clear) -> NSAttributedString {
        return NSAttributedString(icon: self, fontSize: fontSize, color: color, backgroundColor: backgroundColor)
    }
    
}

extension Amazing {
    
    /// Returns an unique identifier string that contains the font name, font style and icon name
    public var detailedKey: String {
        return String(reflecting: self)
            .split(separator: ".")
            .suffix(3)
            .map { String($0).camelCaseToString(with: "-").lowercased() }
            .joined(separator: ".")
    }
    
    /// Returns an unique identifier string that contains the icon name
    public var key: String {
        return String(describing: self).camelCaseToString(with: "-").lowercased()

    }
    
    /// Returns a human readable string that describes the icon
    public var description: String {
        return String(describing: self).camelCaseToString()
    }
    
    /// An array with all keys of all icons of the font style
    public static var allKeys: [String] {
        return allCases.map { $0.key }
    }

    /// An array with all detailed keys of all icons of the font style
    public static var allDetailedKeys: [String] {
        return allCases.map { $0.detailedKey }
    }
    
    /// An array with all human readable descriptions of all icons of the font style
    public static var allDescriptions: [String] {
        return allCases.map { $0.description }
    }
    
    // MARK: - Removed
    
    @available(*, unavailable, renamed: "allKeys")
    public static var keys: [String] {
        get {
            fatalError()
        }
    }
    
    @available(*, unavailable, renamed: "allDescriptions")
    public static var labels: [String] {
        get {
            fatalError()
        }
    }
    
    @available(*, unavailable, renamed: "rawValue")
    public var code: String {
        get {
            fatalError()
        }
    }
    
    @available(*, unavailable, renamed: "key")
    public var name: String {
        get {
            fatalError()
        }
    }
    
    @available(*, unavailable, renamed: "description")
    public var label: String {
        get {
            fatalError()
        }
    }
    
}

extension Awesome {
    @available(*, unavailable, renamed: "Brand")
    public typealias brand = Awesome.Brand
    
    @available(*, unavailable, renamed: "Regular")
    public typealias regular = Awesome.Regular
    
    @available(*, unavailable, renamed: "Solid")
    public typealias solid = Awesome.Solid
}

extension AwesomePro {
    @available(*, unavailable, renamed: "Brand")
    public typealias brand = AwesomePro.Brand
    
    @available(*, unavailable, renamed: "Regular")
    public typealias regular = AwesomePro.Regular
    
    @available(*, unavailable, renamed: "Solid")
    public typealias solid = AwesomePro.Solid
    
    @available(*, unavailable, renamed: "Light")
    public typealias light = AwesomePro.Light
}

extension Awesome.Brand {
    
    @available(*, unavailable, renamed: "allCases")
    public static var all: [Awesome.Brand] {
        get {
            fatalError()
        }
    }
        
}

extension Awesome.Regular {
    
    @available(*, unavailable, renamed: "allCases")
    public static var all: [Awesome.Regular] {
        get {
            fatalError()
        }
    }
    
}

extension Awesome.Solid {
    
    @available(*, unavailable, renamed: "allCases")
    public static var all: [Awesome.Solid] {
        get {
            fatalError()
        }
    }
    
}

extension AwesomePro.Brand {
    
    @available(*, unavailable, renamed: "allCases")
    public static var all: [AwesomePro.Brand] {
        get {
            fatalError()
        }
    }
    
}

extension AwesomePro.Regular {
    
    @available(*, unavailable, renamed: "allCases")
    public static var all: [AwesomePro.Regular] {
        get {
            fatalError()
        }
    }
    
}

extension AwesomePro.Solid {
    
    @available(*, unavailable, renamed: "allCases")
    public static var all: [AwesomePro.Solid] {
        get {
            fatalError()
        }
    }
    
}

extension AwesomePro.Light {
    
    @available(*, unavailable, renamed: "allCases")
    public static var all: [AwesomePro.Light] {
        get {
            fatalError()
        }
    }
    
}
