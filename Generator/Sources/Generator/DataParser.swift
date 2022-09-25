//
//  Parser.swift
//  
//
//  Created by Kingtak Justin Wong on 9/19/22.
//

import Foundation
import SwiftyJSON

protocol DataParser {
    associatedtype T: BaseIcon

    var location: String { get set }

    var olderStyle: Bool { get }

    func metadataParser() -> [T]

    func parseJSON(_ data: [String: JSON]) -> [T]
    
}
