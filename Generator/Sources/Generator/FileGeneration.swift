//
//  FileGeneration.swift
//  
//
//  Created by Kingtak Justin Wong on 9/20/22.
//

import Foundation

/// Way to track different options and how to build different parts of the tile
struct FileGeneration {
    // MARK: - Enum

    /// Uper level types that define the structure
    enum OverallType: String {
        case `struct`
        case `extension`
        case `var`
        case `enum`
        case `typealias`
    }

    /// Modifiers to the func including return type
    enum Extensions: Equatable {
        case `string`
        case `caseiterable`
        case anyAwesomefont
        case awesomeFont
        case `static`
        case amazing
        case `public`
        case `private`
        case `equatable`
        case funcReturn(String)
        case varReturn(String)

        var description: String {
            switch self {
            case .string: return "String"
            case .caseiterable: return "CaseIterable"
            case .anyAwesomefont: return "any AwesomeFont"
            case .awesomeFont: return "AwesomeFont"
            case .static: return "static"
            case .amazing: return "Amazing"
            case .private: return "private"
            case .public: return "public"
            case .equatable: return "Equatable"
            case .funcReturn(let returnValue): return "\(returnValue)"
            case .varReturn(let returnValue): return "\(returnValue)"
            }
        }
        
        static var toSkip: [Extensions] {
            [.public, .private, .static]
        }
    }

    
    /// How should the indentation level be adjusted
    enum IndentSpacer {
        case same
        case increase(Int = 1)
        case decrease(Int = 1)
    }
    
    /// To easily track the level that should be returned
    let indentationLeveler = IndentationTracker()

    // MARK: - Vars
    let type: Membership
    let spacingDeliminator: String = "    "
    let dateFormat = "dd/MM/yyyy HH:mm"
    
    /// The date formatted as expected
    var formattedDate: String {
        formatter().string(from: Date())
    }

    /// The top of the file
    var header: String {
        """
        //
        //  \(type.association).swift
        //  Awesome
        //
        //  Originally created by Ondrej Rafaj on 13/10/2017.
        //  Copyright ©\(Calendar.current.component(.year, from: Date())) manGoweb UK. All rights reserved.
        //
        //  This file has been auto-generated on \(formattedDate)).

        import Foundation
        
        """
    }
    
    private func formatter() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        
        return dateFormatter
    }

    
    /// This helps simply building headers for various components of the file
    /// - Parameters:
    ///   - type: the type of structure that is generated
    ///   - name: the referenced name of the generated struture in code
    ///   - modifiers: different modifiers to the function
    ///   - level: How to adjust indentation for the headers
    ///   - addExtraNewLine: should add an extra new line at the end
    /// - Returns: the built header
    func buildHeader(for type: OverallType,
                     with name: String,
                     modifiers: [Extensions] = [],
                     indentBy level: IndentSpacer = .same,
                     addExtraNewLine: Bool = true) -> String {

        var enumName: String = ""
       
        enumName += indent(for: level)

        if modifiers.contains(.static) {
            enumName += "static "
        }

        if modifiers.contains(.public) {
            enumName += "public "
        } else if modifiers.contains(.private) {
            enumName += "private "
        }

        enumName += "\(type.rawValue) \(name)"
        
        if !modifiers.isEmpty {
            var firstPass = true
            var stopEvaluating = false

            for modifier in modifiers where !Extensions.toSkip.contains(modifier) && !stopEvaluating {
                if case let .varReturn(returnValue) = modifier {
                    enumName += ": " + returnValue
                    stopEvaluating = true
                } else if case let .funcReturn(returnValue) = modifier {
                    enumName += " -> " + returnValue
                    stopEvaluating = true
                } else {
                    if firstPass {
                        enumName += ":"
                        firstPass = false
                    }
                    enumName += " " + modifier.description + ","
                }
            }
            
            if enumName.last == "," {
                enumName.removeLast()
            }
        }
        
        enumName += " {"
        
        if addExtraNewLine {
            enumName += "\n"
        }
        
        return enumName
    }
    
    func generateCase(_ `case`: String, value: String? = nil, includeDot: Bool = false, indentBy: IndentSpacer = .increase()) -> String {

        var caseString = indent(for: indentBy)

        caseString += "case \(includeDot ? "." : "")\(`case`)\(value != nil ? " = \"\(value ?? "")\"" : "")"
        
        adjustIndent(for: .decrease())

        return caseString
    }

    /// Returns the spacing for indentation to the current line
    /// - Parameter level: how the indentation should be adjusted
    /// - Returns: the indentation levels
    func indent(for level: IndentSpacer = .same) -> String {
        switch level {
        case let .decrease(amount):
            indentationLeveler.decrease(by: amount)
            
        case let .increase(amount):
            indentationLeveler.increase(by: amount)

        case .same:
            break
        }
        
        return indentationLeveler.returnCorrectSpacing(for: spacingDeliminator)
    }
    
    /// Adjust indentation without a string
    /// - Parameter level: how the indentation should be adjusted
    func adjustIndent(for level: IndentSpacer) {
        switch level {
        case let .decrease(amount):
            indentationLeveler.decrease(by: amount)
            
        case let .increase(amount):
            indentationLeveler.increase(by: amount)

        case .same:
            break
        }
        
        indentationLeveler.currentIndentLevel = indentationLeveler.desiredIndentLevel
    }
}

class IndentationTracker {
    var currentIndentLevel: Int = 0
    var desiredIndentLevel: Int = 0

    func increase(by amount: Int = 1) {
        desiredIndentLevel += amount
    }
    
    func decrease(by amount: Int = 1) {
        desiredIndentLevel = max(0, currentIndentLevel - amount)
    }
    
    func returnCorrectSpacing(for deliminator: String) -> String {
        var content = ""

        guard desiredIndentLevel > 0 else {
            currentIndentLevel = desiredIndentLevel
            return content
        }

        for _ in 0 ..< desiredIndentLevel {
            content += deliminator
        }
        
        currentIndentLevel = desiredIndentLevel
        
        return content
    }
}
