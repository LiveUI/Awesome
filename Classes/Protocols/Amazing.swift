//
//  Amazing.swift
//  Awesome
//
//  Created by Ondrej Rafaj on 15/10/2017.
//

import Foundation

public protocol Amazing {
    
    init?(rawValue: String)

    var key: String { get }
    var description: String { get }
    var rawValue: String { get }
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
