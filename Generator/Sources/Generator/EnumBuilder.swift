import Foundation

func buildEnum (_ name: String, from styles: [String: [Icon]]) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd/MM/yyyy HH:mm"
    
    var content = ""
    content += "//\n//  \(name).swift\n//  AwesomeEnum\n//\n//  Originally created by Ondrej Rafaj on 13/10/2017.\n"
    content += "//  Copyright © 2017 manGoweb UK. All rights reserved.\n//\n"
    content += "//  This file has been auto-generated on \(formatter.string(from: Date())).\n\nimport Foundation\n\npublic struct \(name) {\n"
    
    for (var style, list) in styles {
        if style == "brands" { style = "brand" }
        
        content += "\n    public enum \(style.firstUppercased()): String, Amazing {\n"
        var names = [String]()
        for icon in list {
            var name = icon.name.split(separator: "-").map { $0.firstUppercased() }.joined(separator: "")
            name = name.prefix(1).lowercased() + name.dropFirst()
            if Int(name.prefix(1)) != nil { name = "fa\(name)" }
            names.append(name)
            
            content += "        case \(name.isKeyword ? "`\(name)`" : name) = \"\\u{\(icon.unicode)}\"\n"
        }
        content += "\n        public var fontType: AwesomeFont {\n            return \(name).Font.\(style)\n        }\n"
        content += "    }\n"
        
        print("  Style \"\(style)\" has \(list.count) icons.")
    }
    
    content += "\n}\n"
    
    return content
}
