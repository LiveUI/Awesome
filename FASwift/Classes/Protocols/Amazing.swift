//
//  Amazing.swift
//  FASwift
//
//  Created by Ondrej Rafaj on 15/10/2017.
//

import Foundation


public protocol Amazing {
    
    init?(rawValue: String)
    
    var code: String { get }
    
    static var keys: [String] { get }
    static var labels: [String] { get }
    
    var fontType: Font { get }

}
