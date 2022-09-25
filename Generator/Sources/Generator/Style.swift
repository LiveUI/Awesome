//
//  Style.swift
//  Generator
//
//  Created by Kingtak Justin Wong on 9/19/22.
//

import Foundation

enum Style: String, CaseIterable {
    case solid
    case thin
    case light
    case brands
    case regular
    case duotone
    
    var weight: String {
        switch self {
        case .regular, .brands:
            return "400"
        case .solid, .duotone:
            return "900"
        case .light, .thin:
            return "300"
        }
    }    
}

extension Style {
    var alias: String {
        switch self {
            case .brands: return "brand"
            default: return self.rawValue
        }
    }
}
