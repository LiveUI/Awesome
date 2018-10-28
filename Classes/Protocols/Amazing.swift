//
//  Amazing.swift
//  Awesome
//
//  Created by Ondrej Rafaj on 15/10/2017.
//

import Foundation

public protocol Amazing: RawRepresentable, CaseIterable where RawValue == String {
    
    var key: String { get }
    var description: String { get }
    var fontType: AwesomeFont { get }

    static var allKeys: [String] { get }
    static var allDescriptions: [String] { get }
    
    @available(swift, deprecated: 4.2, message: "This will be removed in the future. Please use .allKeys instead")
    static var keys: [String] { get }
    
    @available(swift, deprecated: 4.2, message: "This will be removed in the future. Please use .allDescriptions instead")
    static var labels: [String] { get }

    @available(swift, deprecated: 4.2, message: "This will be removed in the future. Please use .rawValue instead.")
    var code: String { get }
    
    @available(swift, deprecated: 4.2, message: "This will be removed in the future. Please use .key instead.")
    var name: String { get }
    
    @available(swift, deprecated: 4.2, message: "This will be removed in the future. Please use .description instead.")
    var label: String { get }
    
}

extension Amazing {
    
    public var code: String {
        return self.rawValue
    }
    
    public var key: String {
        
        return String(reflecting: self)
            .split(separator: ".")
            .suffix(3)
            .map { camelCaseToString(string: String($0), withSeparator: "-").lowercased() }
            .joined(separator: ".")
        
    }
    
    public var description: String {
        return camelCaseToString(string: String(describing: self))
    }
    
    public var name: String {
        return camelCaseToString(string: String(describing: self), withSeparator: "-").lowercased()
    }
    
    public var label: String {
        return self.description
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
    
    private func camelCaseToString(string: String, withSeparator: String = " ") -> String {
        
        let string = string.firstUppercased
        let regex = try! NSRegularExpression(pattern: "([A-Z][a-z\\.]*)")
        let range = NSRange(string.startIndex..., in: string)
        
        return regex.matches(
            in: string,
            options: .anchored,
            range: range )
            .map { String(string[Range($0.range, in: string)!]) }
            .joined(separator: withSeparator)

    }
    
}
