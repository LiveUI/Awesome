//
//  Awesome.swift
//  Awesome
//
//  Originally created by Ondrej Rafaj on 13/10/2017.
//  Copyright ©2022 manGoweb UK. All rights reserved.
//
//  This file has been auto-generated on 25/09/2022 01:41).

import Foundation

public extension Awesome {
    enum Font: CaseIterable, Equatable {
        case classic(Classic)

        static public var allCases: [Awesome.Font] {
            var fonts: [Awesome.Font] = []
            fonts += Classic.allCases.map { .classic($0) }
            return fonts
        }

        public enum Classic: String, Equatable, AwesomeFont, CaseIterable {
            case regular
            case brand
            case solid

            public var file: String {
                switch self {
                    case .regular:
                        return "fa-regular-400"
                    case .brand:
                        return "fa-brands-400"
                    case .solid:
                        return "fa-solid-900"
                }
            }

            public var description: String {
                switch self {
                    case .regular:
                        return "Font Awesome 6 Free"
                    case .brand:
                        return "Font Awesome 6 Brands"
                    case .solid:
                        return "Font Awesome 6 Free"
                }
            }

            public var memberName: String {
                switch self {
                    case .regular:
                        return "FontAwesome6Free-Regular"
                    case .brand:
                        return "FontAwesome6Brands-Brands"
                    case .solid:
                        return "FontAwesome6Free-Solid"
                }
            }

            public static func loadFonts(from bundle: Bundle, only: [Classic] = []) {
                var fonts = Classic.allCases 
                if !only.isEmpty {
                    fonts = fonts.filter { element in only.contains(element) }
                }
                fonts.forEach { font in 
                    Fonts.load(type: font, from: bundle)
                }
            }
        }

    }

    static func loadFonts(from bundle: Bundle, only: [Font] = []) {
        var fonts = Font.allCases
        if !only.isEmpty {
            fonts = fonts.filter { element in only.contains(element) }
        }
        fonts.forEach { font in
            let currStyle: AwesomeFont
            switch font {
                case let .classic(style):
                    currStyle = style

            }
            Fonts.load(type: currStyle, from: bundle)
        }
    }

}
