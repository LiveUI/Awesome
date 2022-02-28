//
//  Fonts.swift
//  Awesome
//
//  Created by Ondrej Rafaj on 14/10/2017.
//

import Foundation
import CoreGraphics
import CoreText

public extension AwesomeFont {
    
    @available(*, unavailable, renamed: "description")
    var name: String {
        get {
            fatalError()
        }
    }
    
}

public extension Awesome {
    
    enum Font: String, AwesomeFont {
        
        case brand = "fa-brands-400"
        case regular = "fa-regular-400"
        case solid = "fa-solid-900"
        
        public var file: String {
            return rawValue
        }
        
        public var description: String {
            switch self {
            case .brand:
                return "Font Awesome 6 Brands"
            case .regular, .solid:
                return "Font Awesome 6 Free"
            }
        }
        
        public var memberName: String {
            switch self {
            case .brand:
                return "FontAwesome6Brands-Regular"
            case .regular:
                return "FontAwesome6Free-Regular"
            case .solid:
                return "FontAwesome6Free-Solid"
            }
        }
    }
    
}

public extension AwesomePro {

    enum Font: String, AwesomeFont {
        case brand = "fa-brands-400"
        case regular = "fa-regular-400"
        case solid = "fa-solid-900"
        case light = "fa-light-300"
        case duotone = "fa-duotone-900"

        public var file: String {
            return rawValue
        }
        
        public var description: String {
            switch self {
                case .brand:
                    return "Font Awesome 6 Brands"
                case .regular, .solid, .light, .duotone:
                    return "Font Awesome 6 Pro"
            }
        }
        
        public var memberName: String {
            switch self {
            case .brand:
                return "FontAwesome6Brands-Regular"
            case .regular:
                return "FontAwesome6Pro-Regular"
            case .solid:
                return "FontAwesome6Pro-Solid"
            case .light:
                return "FontAwesome6Pro-Light"
            case .duotone:
                return "FontAwesome6Duotone-Solid"
            }
        }
    }

    static func loadFonts(from bundle: Bundle, only: [Font] = []) {
        var fonts: [Font] = [.brand, .regular, .solid, .light, .duotone]

        if only.count > 0 {
            fonts = fonts.filter { element in only.contains(element) }
        }

        for font in fonts {
            Fonts.load(type: font, from: bundle)
        }
    }

}

class Fonts {

    static func load(type: AwesomeFont, from bundle: Bundle? = nil) {
        guard !Amazing.Font.fontNames(forFamilyName: type.description).contains(type.memberName) else {
            return
        }

        let fontBundle: Bundle
        #if SWIFT_PACKAGE
        fontBundle = bundle ?? Bundle.module
        #else
        fontBundle = bundle ?? Bundle(for: Self.self)
        #endif

        let identifier = fontBundle.bundleIdentifier
        let isCocoapods = identifier?.hasPrefix("org.cocoapods") == true

        let fontURL = fontBundle.url(forResource: type.file, withExtension: "ttf", subdirectory: isCocoapods ? "Awesome.bundle" : nil)
        guard let url = fontURL else {
            return
        }

        let data = try! Data(contentsOf: url as URL)
        let provider = CGDataProvider(data: data as CFData)
        let font = CGFont(provider!)

        var error: Unmanaged<CFError>?

        if CTFontManagerRegisterGraphicsFont(font!, &error) == false {
            let errorDescription: CFString = CFErrorCopyDescription(error!.takeUnretainedValue())
            let nsError = error!.takeUnretainedValue() as AnyObject as! NSError
            NSException(name: NSExceptionName.internalInconsistencyException, reason: errorDescription as String, userInfo: [NSUnderlyingErrorKey: nsError]).raise()
        }
        
    }
    
}
