import Foundation

func buildEnum (_ name: String, from styles: [String: [Icon]]) -> String {
    var content = ""
    content += "//\n//  \(name).swift\n//  AwesomeEnum\n//\n//  Originally created by Ondrej Rafaj on 13/10/2017.\n"
    content += "//  Copyright © 2017 manGoweb UK. All rights reserved.\n//\n"
    content += "//  This file has been auto-generated.\n\nimport Foundation\n\npublic struct \(name) {\n"

    for (style, list) in styles {
        content += "\n    public enum \(style): String, Amazing {\n"
        var names = [String]()
        for icon in list {
            var name = icon.name.split(separator: "-").map({ $0.prefix(1).uppercased() + $0.dropFirst() }).joined(separator: "")
            name = name.prefix(1).lowercased() + name.dropFirst()
            if Int(name.prefix(1)) != nil { name = "fa\(name)" }
            names.append(name)

            content += "        case \(name) = \"\\u{\(icon.unicode)}\"\n"
        }

        content += "\n        public static var all: [\(style)] {\n            return [ \(names.map({"\(style).\($0)"}).joined(separator: ", ")) ]\n        }\n"
        content += "\n        public static var labels: [String] {\n            return [ \(list.map({"\"\($0.name)\""}).joined(separator: ", ")) ]\n        }\n"
        content += "\n        public var code: String {\n            return rawValue\n        }\n"
        content += "\n        public var fontType: AwesomeFont {\n            return \(name).Font.\(style)\n        }\n"

        content += "    }\n"

        print("  Style \"\(style)\" has \(list.count) icons.")
    }

    content += "\n}\n"

    return content
}
