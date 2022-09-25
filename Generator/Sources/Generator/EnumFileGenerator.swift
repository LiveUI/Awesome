import Foundation


struct EnumFileGenerator {

    let options: FileGeneration
    var oldStyle : Bool

    func body(from families: [Family: [UpdatedIcon]]) -> String {
        print("\nGenerating \(options.type.association).swift\n")

        var fileBody = options.header

        fileBody += options.buildHeader(for: .struct, with: options.type.association, modifiers: [.public]) 
        fileBody += oldStyle ? oldFormat(from: families) : newFormat(from: families)
        fileBody += "\n" + options.indent(for: .decrease()) + "}\n"
        
        return fileBody
    }
    
    private func oldFormat(from families: [Family: [UpdatedIcon]]) -> String {
        var fileBody = ""

        for (family, list) in families {
            var familyStyles = [Style: [UpdatedIcon]]()

            // Gather similar styles together
            for style in Style.allCases {
                guard family.enumName(onlyStyle: true).contains(style.alias) else {
                    continue
                }

                if familyStyles[style] == nil {
                    familyStyles[style] = []
                }

                for icon in list {
                    familyStyles[style]?.append(icon)
                }
            }
            
            options.adjustIndent(for: .increase())

            for icons in familyStyles {
                guard family.enumName(onlyStyle: true).contains(icons.key.alias) else { continue }

                fileBody += options.buildHeader(for: .enum,
                                                with: "\(icons.key.alias)".firstUppercased(),
                                                modifiers: [.string, .amazing, .public],
                                                indentBy: .same)
                
                for icon in icons.value {
                    fileBody += generateIconCase(icon: icon) + "\n"
                }

                fileBody += "\n"
                fileBody += options.indent(for: .increase())
                
                fileBody += "public static func withKey(_ label: String) -> "
                fileBody += icons.key.alias.firstUppercased() + "? {\n"

                fileBody += options.indent(for: .increase())

                fileBody += "return self.allCases.first { label == \"\\($0)\" }\n"

                fileBody += options.indent(for: .decrease()) + "}"
                fileBody += generateFontType(name: "\(options.type.association)",
                                             postFix: "\(family.rawDescription.firstUppercased()).\(icons.key.alias)")

                fileBody += options.indent() + "}\n"
                options.adjustIndent(for: .decrease())
            }

            print("Style \"\(family.enumName(onlyStyle: false))\" has \(list.count) icons.")
        }

        return fileBody
    }
    
    private func newFormat(from families: [Family: [UpdatedIcon]]) -> String {
        var fileBody = ""
        var normalizedData = [
            String: [Family: [UpdatedIcon]]
        ]()

        for (family, list) in families {
            if normalizedData[family.rawDescription] == nil {
                normalizedData[family.rawDescription] = [:]
            }
            
            if normalizedData[family.rawDescription]?[family] == nil {
                normalizedData[family.rawDescription]?[family] = []
            }
            
            normalizedData[family.rawDescription]?[family]?.append(contentsOf: list)
        }

        for family in normalizedData {
            var totalFamilyIconCount = 0

            fileBody += options.buildHeader(for: .enum,
                                            with: family.key.firstUppercased(),
                                            modifiers: [.public],
                                            indentBy: .increase())
            
            for style in family.value {
                fileBody += options.generateCase("\(style.key.enumName(onlyStyle: true).lowercased())(\(style.key.enumName(onlyStyle: true).firstUppercased()))") + "\n"
            }

            fileBody += "\n"
            
            for style in family.value {
                var iconCount = 0

                fileBody += options.buildHeader(for: .enum,
                                                with: style.key.enumName(onlyStyle: true).firstUppercased(),
                                                modifiers: [.string, .amazing, .public],
                                                indentBy: .increase())
                
                for icon in style.value {
                    iconCount += 1
                    fileBody += generateIconCase(icon: icon) + "\n"
                }
                
                fileBody += "\n"
                fileBody += options.indent(for: .increase())
                
                fileBody += "public static func withKey(_ label: String) -> "
                fileBody += style.key.enumName(onlyStyle: true).firstUppercased() + "? {\n"

                fileBody += options.indent(for: .increase())

                fileBody += "return self.allCases.first { label == \"\\($0)\" }\n"
                
                fileBody += options.indent(for: .decrease()) + "}\n"

                fileBody += generateFontType(name: "\(options.type.association)",
                                             postFix: "\(family.key.firstUppercased()).\(style.key.enumName(onlyStyle: true).lowercased())")
                fileBody += options.indent() + "}\n"
              
                print("Style \"\(style.key.enumName().fullCasing())\" has \(iconCount) icons.")
                options.adjustIndent(for: .decrease())
                totalFamilyIconCount += iconCount
            }
            
            repeat {
                fileBody += options.indent(for: .decrease()) + "}\n"
            } while options.indentationLeveler.currentIndentLevel > 0
  
            print("\(family.key.firstUppercased()) has a total of \(totalFamilyIconCount) icons. \n")
        }
        
        return fileBody
    }
    
    func generateIconCase(icon: any BaseIcon) -> String {
        let normalizedName = generateName(name: icon.name)

        return options.generateCase(normalizedName.isKeyword ? "`\(normalizedName)`" : normalizedName, value: "\\u{\(icon.unicode)}")
    }

    func generateName(name: String) -> String {
        var outputName = name.split(separator: "-").map { $0.firstUppercased() }.joined(separator: "")
        let initialLetter = outputName.prefix(1)
        
        outputName = initialLetter.lowercased() + outputName.dropFirst()
        
        if Int(initialLetter) != nil { outputName = "fa\(outputName)" }
        
        return outputName
    }

    func generateFontType(name: String, postFix: String) -> String {
        var content = "\n" + options.buildHeader(for: .var,
                                          with: "fontType",
                                          modifiers: [.public, .awesomeFont])

        content += options.indent(for: .increase())

        content += "return \(name).Font.\(postFix)\n"

        content += options.indent(for: .decrease())

        content += "}\n"
        
        options.adjustIndent(for: .decrease())

        return content
    }
}


