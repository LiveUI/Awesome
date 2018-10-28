//
//  AwesomeFont.swift
//  Awesome
//
//  Created by Christopher Mühl on 20/06/2018.
//

import Foundation

public protocol AwesomeFont: CustomStringConvertible {

    var file: String { get }
    var memberName: String { get }

    // MARK: Deprecated
    
    var name: String { get }
}
