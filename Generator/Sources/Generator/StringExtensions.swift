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
            "_",
            "Any",
            "as",
            "associatedtype",
            "associativity",
            "await",
            "aync",
            "break",
            "case",
            "catch",
            "class",
            "continue",
            "convenience",
            "default",
            "defer",
            "deinit",
            "didSet",
            "do",
            "dynamic",
            "else",
            "enum",
            "extension",
            "fallthrough",
            "false",
            "fileprivate",
            "final",
            "for",
            "func",
            "get",
            "guard",
            "if",
            "import",
            "in",
            "indirect",
            "init",
            "infix",
            "inout",
            "internal",
            "is",
            "lazy",
            "left",
            "let",
            "mutating",
            "nil",
            "none",
            "nonmutating",
            "open",
            "operator",
            "optional",
            "override",
            "postfix",
            "precedence",
            "precedencegroup",
            "prefix",
            "private",
            "protocol",
            "Protocol",
            "public",
            "repeat",
            "required",
            "rethrows",
            "return",
            "right",
            "self",
            "Self",
            "set",
            "some",
            "static",
            "struct",
            "subscript",
            "super",
            "switch",
            "throw",
            "throws",
            "true",
            "try",
            "Type",
            "typealias",
            "unowned",
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
