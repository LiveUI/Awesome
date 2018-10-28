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
    
    // MARK: Deprecated
    
    static var keys: [String] { get }
    static var labels: [String] { get }
    
    var code: String { get }
    var name: String { get }
    var label: String { get }
    
}
