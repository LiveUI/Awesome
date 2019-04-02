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
                return "Font Awesome 5 Brands"
            case .regular, .solid:
                return "Font Awesome 5 Free"
            }
        }
        
        public var memberName: String {
            switch self {
            case .brand:
                return "FontAwesome5Brands-Regular"
            case .regular:
                return "FontAwesome5Free-Regular"
            case .solid:
                return "FontAwesome5Free-Solid"
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

        public var file: String {
            return rawValue
        }
        
        public var description: String {
            switch self {
                case .brand:
                    return "Font Awesome 5 Brands"
                case .regular, .solid, .light:
                    return "Font Awesome 5 Pro"
            }
        }
        
        public var memberName: String {
            switch self {
            case .brand:
                return "FontAwesome5Brands-Regular"
            case .regular:
                return "FontAwesome5Pro-Regular"
            case .solid:
                return "FontAwesome5Pro-Solid"
            case .light:
                return "FontAwesome5Pro-Light"
            }
        }
    }

    static func loadFonts(from bundle: Bundle, only: [Font] = []) {
        var fonts: [Font] = [.brand, .regular, .solid, .light]

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
        guard !Font.fontNames(forFamilyName: type.description).contains(type.memberName) else {
            return
        }

        let fontBundle: Bundle!
        if bundle == nil {
            fontBundle = Bundle(for: Fonts.self)
        } else {
            fontBundle = bundle
        }

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
