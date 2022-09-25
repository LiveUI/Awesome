//
//  AwesomePro.swift
//  Awesome
//
//  Originally created by Ondrej Rafaj on 13/10/2017.
//  Copyright ©2022 manGoweb UK. All rights reserved.
//
//  This file has been auto-generated on 24/09/2022 19:03).

import Foundation

public extension AwesomePro {
    enum Font: CaseIterable, Equatable {
        case classic(Classic)

        static public var allCases: [AwesomePro.Font] {
            var fonts: [AwesomePro.Font] = []
            fonts += Classic.allCases.map { .classic($0) }
            return fonts
        }

        public enum Classic: String, Equatable, AwesomeFont, CaseIterable {
            case regular
            case solid
            case light
            case duotone
            case brand

            public var file: String {
                switch self {
                    case .regular:
                        return "fa-regular-400"
                    case .solid:
                        return "fa-solid-900"
                    case .light:
                        return "fa-light-300"
                    case .duotone:
                        return "fa-duotone-900"
                    case .brand:
                        return "fa-brands-400"
                }
            }

            public var description: String {
                switch self {
                    case .regular:
                        return "Font Awesome 6 Pro"
                    case .solid:
                        return "Font Awesome 6 Pro"
                    case .light:
                        return "Font Awesome 6 Pro"
                    case .duotone:
                        return "Font Awesome 6 Duotone"
                    case .brand:
                        return "Font Awesome 6 Brands"
                }
            }

            public var memberName: String {
                switch self {
                    case .regular:
                        return "FontAwesome6Pro-Regular"
                    case .solid:
                        return "FontAwesome6Pro-Solid"
                    case .light:
                        return "FontAwesome6Pro-Light"
                    case .duotone:
                        return "FontAwesome6Duotone-Duotone"
                    case .brand:
                        return "FontAwesome6Brands-Brands"
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
