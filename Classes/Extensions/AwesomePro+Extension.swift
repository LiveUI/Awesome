//
//  AwesomePro.swift
//  Awesome
//
//  Originally created by Ondrej Rafaj on 13/10/2017.
//  Copyright ©2022 manGoweb UK. All rights reserved.
//
//  This file has been auto-generated on 25/09/2022 01:41).

import Foundation

public extension AwesomePro {
    enum Font: CaseIterable, Equatable {
        case duotone(Duotone)
        case classic(Classic)
        case sharp(Sharp)

        static public var allCases: [AwesomePro.Font] {
            var fonts: [AwesomePro.Font] = []
            fonts += Duotone.allCases.map { .duotone($0) }
            fonts += Classic.allCases.map { .classic($0) }
            fonts += Sharp.allCases.map { .sharp($0) }
            return fonts
        }

        public enum Duotone: String, Equatable, AwesomeFont, CaseIterable {
            case solid

            public var file: String {
                switch self {
                    case .solid:
                        return "fa-solid-900"
                }
            }

            public var description: String {
                switch self {
                    case .solid:
                        return "Font Awesome 6 Duotone"
                }
            }

            public var memberName: String {
                switch self {
                    case .solid:
                        return "FontAwesome6Duotone-Solid"
                }
            }

            public static func loadFonts(from bundle: Bundle, only: [Duotone] = []) {
                var fonts = Duotone.allCases 
                if !only.isEmpty {
                    fonts = fonts.filter { element in only.contains(element) }
                }
                fonts.forEach { font in 
                    Fonts.load(type: font, from: bundle)
                }
            }
        }

        public enum Classic: String, Equatable, AwesomeFont, CaseIterable {
            case light
            case brand
            case thin
            case solid
            case regular

            public var file: String {
                switch self {
                    case .light:
                        return "fa-light-300"
                    case .brand:
                        return "fa-brands-400"
                    case .thin:
                        return "fa-thin-300"
                    case .solid:
                        return "fa-solid-900"
                    case .regular:
                        return "fa-regular-400"
                }
            }

            public var description: String {
                switch self {
                    case .light:
                        return "Font Awesome 6 Pro"
                    case .brand:
                        return "Font Awesome 6 Brands"
                    case .thin:
                        return "Font Awesome 6 Pro"
                    case .solid:
                        return "Font Awesome 6 Pro"
                    case .regular:
                        return "Font Awesome 6 Pro"
                }
            }

            public var memberName: String {
                switch self {
                    case .light:
                        return "FontAwesome6Pro-Light"
                    case .brand:
                        return "FontAwesome6Brands-Brands"
                    case .thin:
                        return "FontAwesome6Pro-Thin"
                    case .solid:
                        return "FontAwesome6Pro-Solid"
                    case .regular:
                        return "FontAwesome6Pro-Regular"
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

        public enum Sharp: String, Equatable, AwesomeFont, CaseIterable {
            case solid

            public var file: String {
                switch self {
                    case .solid:
                        return "fa-solid-900"
                }
            }

            public var description: String {
                switch self {
                    case .solid:
                        return "Font Awesome 6 Sharp"
                }
            }

            public var memberName: String {
                switch self {
                    case .solid:
                        return "FontAwesome6Sharp-Solid"
                }
            }

            public static func loadFonts(from bundle: Bundle, only: [Sharp] = []) {
                var fonts = Sharp.allCases 
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
                case let .duotone(style):
                    currStyle = style
                case let .classic(style):
                    currStyle = style
                case let .sharp(style):
                    currStyle = style

            }
            Fonts.load(type: currStyle, from: bundle)
        }
    }

}
