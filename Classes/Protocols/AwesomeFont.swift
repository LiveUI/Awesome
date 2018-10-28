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

    @available(swift, deprecated: 4.2, message: "This will be removed in the future. Please use .description instead.")
    var name: String { get }
}
