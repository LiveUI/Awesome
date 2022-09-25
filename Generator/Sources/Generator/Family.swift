//
//  Family.swift
//  
//
//  Created by Kingtak Justin Wong on 9/19/22.
//

import Foundation

enum Family: Codable, Hashable, CaseIterable {
    static var allCases: [Family] = {
        var allCases: [Family] = [.classic(.light), .classic(.duotone), .classic(.brands), .classic(.solid), .classic(.regular), .classic(.thin)]
        allCases += [.duotone(.light), .duotone(.duotone), .duotone(.brands), .duotone(.solid), .duotone(.regular), .duotone(.thin)]
        allCases += [.sharp(.light), .sharp(.duotone), .sharp(.brands), .sharp(.solid), .sharp(.regular), .sharp(.thin)]
        return allCases
    }()
    
    case classic(Style)
    case duotone(Style)
    case sharp(Style)

    init(family: String, style: String, olderPort: Bool = false) throws {
        guard let assignedStyle = Style.init(rawValue: style) else {
            throw CodingError.unknownStyle
        }

        switch family {
        case "classic":
            self = .classic(assignedStyle)
        case "duotone":
            self = .duotone(assignedStyle)
        case "sharp":
            self = .sharp(assignedStyle)
        default:
            
            if olderPort {
                self = .classic(assignedStyle)
                return
            }

            throw CodingError.unknownFamiliy
        }
    }
    
    func enumName(onlyStyle: Bool = false) -> String {
        var finalStyle: String

        switch self {
        case let .classic(style):
            finalStyle = style.alias
        case let .duotone(style):
            finalStyle = style.alias
        case let .sharp(style):
            finalStyle = style.alias
        }
        
        return "\(onlyStyle ? "" : self.rawDescription + "_")\(finalStyle)"
    }

    var fontAwesomeVersion: String {
        "Font Awesome 6"
    }

    func fontFileDescription(isFree: Bool = false) -> String {
        switch self {
        case let .classic(style):
            switch style {
            case .brands:
                return "\(fontAwesomeVersion) Brands"
            case .duotone:
                return "\(fontAwesomeVersion) Duotone"
            default:
                return "\(fontAwesomeVersion) \(isFree ? "Free" : "Pro")"
            }
        case .duotone:
            return "\(fontAwesomeVersion) Duotone"
        case let .sharp(style):
            switch style {
            case .solid:
                return "\(fontAwesomeVersion) Sharp"
            default:
                return ""
            }
            
        }
    }
    
    func memberName(isFree: Bool = false) -> String {
        var initialString = self.fontFileDescription(isFree:  isFree).replacingOccurrences(of: " ", with: "") + "-"

        switch self {
        case .sharp(let style),
             .duotone(let style),
             .classic(let style):
            initialString += style.rawValue.firstUppercased()
        }
        
        return initialString
    }
    
    var file: String {
        var tempName = "fa-"
        
        switch self {
        case .sharp(let style),
             .duotone(let style),
             .classic(let style):
            tempName += style.rawValue.lowercased() + "-" + style.weight
        }
        
        return tempName
    }

    var stringDescription: String {
        var finalStyle: String
        
        switch self {
            case let .classic(style):
                finalStyle = style.alias
            case let .duotone(style):
                finalStyle = style.alias
            case let .sharp(style):
                finalStyle = style.alias
        }
        
        return "\(self.rawDescription)_\(finalStyle)"
    }
    
    var rawDescription: String {
        switch self {
            case .classic(_): return "classic"
            case .duotone(_): return "duotone"
            case .sharp(_): return "sharp"
        }
    }

    enum CodingError: Error {
        case unknownStyle
        case unknownFamiliy
    }

    enum CodingKeys: CodingKey {
        case name
        case style
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(self.stringDescription, forKey: .name)
        
        var extractedStyle: String = ""
        
        switch self {
        case .sharp(let style):
            extractedStyle = style.rawValue
        case .duotone(let style):
            extractedStyle = style.rawValue
        case .classic(let style):
            extractedStyle = style.rawValue
        }
        
        try container.encode(extractedStyle, forKey: .style)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let name = try container.decode(String.self, forKey: .name)
        let encodedStyle = try container.decode(String.self, forKey: .style)
        
        guard let style = Style.init(rawValue: encodedStyle) else {
            throw CodingError.unknownStyle
        }

        switch name {
        case "classic":
            self = .classic(style)
        case "duotone":
            self = .duotone(style)
        case "sharp":
            self = .sharp(style)
        default:
            throw CodingError.unknownFamiliy
        }
    }
}
