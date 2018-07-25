import Foundation

extension Substring {
    func firstUppercased() -> Substring {
        return prefix(1).uppercased() + dropFirst()
    }
}

extension String {
    func firstUppercased() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
    
    var isKeyword: Bool {
        switch self {
        case
        "associativity",
        "break",
        "case",
        "catch",
        "class",
        "continue",
        "convenience",
        "default",
        "deinit",
        "didSet",
        "do",
        "else",
        "enum",
        "extension",
        "fallthrough",
        "false",
        "final",
        "for",
        "func",
        "get",
        "guard",
        "if",
        "in",
        "infix",
        "init",
        "inout",
        "internal",
        "lazy",
        "let",
        "mutating",
        "nil",
        "operator",
        "override",
        "postfix",
        "precedence",
        "prefix",
        "private",
        "public",
        "repeat",
        "required",
        "return",
        "self",
        "set",
        "static",
        "struct",
        "subscript",
        "super",
        "switch",
        "throws",
        "true",
        "try",
        "var",
        "weak",
        "where",
        "while",
        "willSet":
            return true
        default:
            return false
        }
    }
}
