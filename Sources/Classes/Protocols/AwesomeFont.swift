//
//  AwesomeFont.swift
//  Awesome
//
//  Created by Christopher Mühl on 20/06/2018.
//

import Foundation

public protocol AwesomeFont: CustomStringConvertible {

    /// The file name that contains the font
    var file: String { get }
    
    /// A unique string that describes the font, version and style
    var memberName: String { get }
    
}
