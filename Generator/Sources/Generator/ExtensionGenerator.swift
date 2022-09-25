//
//  File.swift
//  
//
//  Created by Kingtak Justin Wong on 9/20/22.
//

import Foundation

struct ExtensionGenerator {
    enum Variable {
        case file
        case description
        case membership
        
        var description: String {
            switch self {
            case .file: return "file"
            case .description: return "description"
            case .membership: return "memberName"
            }
        }
    }

    let generator: FileGeneration

    func body(for membership: Membership, from families: Set<Family>) -> String {
        var content = generator.header + "\n"
        
        content += generator.buildHeader(for: .extension,
                                         with: generator.type.association,
                                         modifiers: [.public])
          
        content += generator.buildHeader(for: .enum,
                                         with: "Font",
                                         modifiers: [.caseiterable, .equatable],
                                         indentBy: .increase())
 
        generator.adjustIndent(for: .increase())
 
        let familyStyles = Set(Family.allCases.compactMap { $0.rawDescription })

        for familyStyle in familyStyles where families.contains(where: { familyStyle == $0.rawDescription }) {
            content += generator.indent()
            content += "case "
            content += familyStyle.lowercased() + "(\(familyStyle.firstUppercased()))"
            content += "\n"
        }
        
        content += "\n"

        content += generator.buildHeader(for: .var,
                                         with: "allCases",
                                         modifiers: [.public, .static, .varReturn("[\(membership.association).Font]")])

        content += generator.indent(for: .increase())
        
        content += "var fonts: [\(membership.association).Font] = []\n"

        for familyStyle in familyStyles where families.contains(where: { familyStyle == $0.rawDescription }) {
            content += generator.indent()
            content += "fonts += \(familyStyle.firstUppercased()).allCases.map { .\(familyStyle.lowercased())($0) }\n"
        }
        
        content += generator.indent() + "return fonts\n"

        content += generator.indent(for: .decrease()) + "}\n"

        func makeCase(from family: Family) -> String {
            "\(family.rawDescription.firstUppercased()).allCases.map { .\(family.rawDescription.lowercased())($0) }"
        }

        content += "\n"
        generator.adjustIndent(for: .decrease())

        for familyStyle in familyStyles where families.contains(where: { familyStyle == $0.rawDescription }) {
            content += generator.indent()

            content += generator.buildHeader(for: .enum,
                                             with: familyStyle.firstUppercased(),
                                             modifiers: [.public, .string, .equatable, .awesomeFont, .caseiterable])

            generator.adjustIndent(for: .increase(2))

            for family in families where family.rawDescription == familyStyle {
                content += generator.indent()
                content += "case "
                content += family.enumName(onlyStyle: true)
                content += "\n"
            }

            content += "\n"

            content += generator.indent(for: .decrease())
            generator.adjustIndent(for: .decrease())
            
            
            content += buildVarProperties(for: .file, currentStyle: familyStyle, in: families)
            content += "\n" + generator.indent(for: .decrease())
            generator.adjustIndent(for: .decrease())
            content += buildVarProperties(for: .description, currentStyle: familyStyle, in: families)
            content += "\n" + generator.indent(for: .decrease())
            generator.adjustIndent(for: .decrease())
            content += buildVarProperties(for: .membership, currentStyle: familyStyle, in: families)
            content += "\n"
            
            content += generator.indent()
            content += "public static func loadFonts(from bundle: Bundle, only: [\(familyStyle.firstUppercased())] = []) {\n"
            content += generator.indent(for: .increase())
            content += "var fonts = \(familyStyle.firstUppercased()).allCases \n"
            content += generator.indent()
            content += "if !only.isEmpty {\n"
            content += generator.indent(for: .increase())
            content += "fonts = fonts.filter { element in only.contains(element) }\n"
            content += generator.indent(for: .decrease())
            content += "}\n"
            
            content += generator.indent()

            content += "fonts.forEach { font in \n"
            
            content += generator.indent(for: .increase())
            content += "Fonts.load(type: font, from: bundle)\n"

            repeat {
                content += generator.indent(for: .decrease()) + "}\n"
            } while generator.indentationLeveler.currentIndentLevel > 2
            
            generator.adjustIndent(for: .decrease())
            content += "\n"
        }

        content += generator.indent() + "}\n"

        content += "\n" + generator.indent() + "static func loadFonts(from bundle: Bundle, only: [Font] = []) {\n"

        content += generator.indent(for: .increase())
        content += "var fonts = Font.allCases\n"

        content += generator.indent()

        content += "if !only.isEmpty {\n"
        
        content += generator.indent(for: .increase())

        content += "fonts = fonts.filter { element in only.contains(element) }\n"
        
        content += generator.indent(for: .decrease())

        content += "}\n"
        
        content += generator.indent()
        content += "fonts.forEach { font in\n"
        
        content += generator.indent(for: .increase())
        content += "let currStyle: AwesomeFont\n"

        content += generator.indent()
        content += "switch font {\n"
        
        generator.adjustIndent(for: .increase())

        for familyStyle in familyStyles where families.contains(where: { familyStyle == $0.rawDescription }) {
            content += generator.indent()
            content += "case let .\(familyStyle.lowercased())(style):\n"
            content += generator.indent(for: .increase())
            content += "currStyle = style\n"
            generator.adjustIndent(for: .decrease())
        }

        content += "\n" + generator.indent(for: .decrease())
        content += "}\n"

        content += generator.indent()
        content += "Fonts.load(type: currStyle, from: bundle)\n"
        
        content += generator.indent(for: .decrease())
        content += "}\n"

        content += generator.indent(for: .decrease())
        content += "}\n\n"
        repeat {
            content += generator.indent(for: .decrease()) + "}\n"
        } while generator.indentationLeveler.currentIndentLevel > 0
        
        return content
    }
    
    func buildVarProperties(for variableName: Variable, currentStyle: String, in families: Set<Family>) -> String {
        var content = ""

        content += generator.buildHeader(for: .var, with: variableName.description, modifiers: [.public, .string])
        content += generator.indent(for: .increase(3))
        content += "switch self {\n"

        generator.adjustIndent(for: .increase())
        
        for family in families where family.rawDescription == currentStyle {
            content += generator.generateCase("\(family.enumName(onlyStyle: true))", includeDot: true, indentBy: .same) + ":\n"

            switch variableName {
            case .file:
                content += generator.indent(for: .increase(2))
                content += "return \"" + family.file + "\"\n"
            case .description:
                content += generator.indent(for: .increase(2))
                content += "return \"" + family.fontFileDescription(isFree: generator.type.isFree) + "\"\n"
            case .membership:
                content += generator.indent(for: .increase(2))
                content += "return \"" + family.memberName(isFree: generator.type.isFree) + "\"\n"
            }
            
            generator.adjustIndent(for: .decrease())
        }
        
        generator.adjustIndent(for: .decrease())

        
        content += generator.indent() + "}\n"

        content += generator.indent(for: .decrease()) + "}\n"

        return content
    }
    
    func buildAvailableTitle(with family: String, for enumName: String) -> String {
        """
        @available(*, unavailable, renamed: \"\(family.firstUppercased()).\(enumName.firstUppercased())\")
        public typealias \(family.lowercased()).\(enumName.lowercased()) = \(generator.type.association.firstUppercased()).\(family.firstUppercased()).\(enumName.firstUppercased())
        """
    }
}
