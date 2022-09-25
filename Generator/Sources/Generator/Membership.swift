//
//  Membership.swift
//  
//
//  Created by Kingtak Justin Wong on 9/19/22.
//

import Foundation

enum Membership: String, Codable, Hashable, CaseIterable {
    case free
    case pro
    
    var isFree: Bool {
        self == .free
    }
    
    var association: String {
        switch self {
        case .free: return "Awesome"
        case .pro: return "AwesomePro"
        }
    }
}
