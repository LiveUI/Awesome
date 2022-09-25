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
    func asImage(size: CGSize, color: Color = Color.black, backgroundColor: Color = Color.clear) -> Amazing.Image {
        return Image(icon: self, size: size, color: color, backgroundColor: backgroundColor)
    }
    
    /// Returns a square image with the selected icon
    ///
    /// - Parameters:
    ///   - size: the height and width of the returned image
    ///   - color: the foreground color of the icon
    ///   - backgroundColor: the background color of the icon
    /// - Returns: a square image that contains the selected icon
    func asImage(size: CGFloat, color: Color = Color.black, backgroundColor: Color = Color.clear) -> Amazing.Image {
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
    
    init?(unicode: String) {
        guard
            let bytes = (unicode.count > 2 ? unicode : "00\(unicode)").bytes(),
            let value = String(data: Data(bytes), encoding: .utf16)
        else {
            return nil
        }
        self.init(rawValue: value)
    }

    var unicode: String {
        let scalars = rawValue.unicodeScalars
        let value = scalars[scalars.startIndex].value

        return String(format: "%02x", value)
    }
}

#if canImport(SwiftUI)
import SwiftUI

@available(iOS 13, macOS 11, watchOS 6, tvOS 13, *)
public extension Amazing {
    /// A SwiftUI Image of the icon
    var image: Awesome.Image<Self> {
        Awesome.Image(icon: self)
    }
}
#endif

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
