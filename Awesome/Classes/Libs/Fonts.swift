//
//  Fonts.swift
//  Awesome
//
//  Created by Ondrej Rafaj on 14/10/2017.
//

import Foundation


public extension Awesome {
    
    public enum Font: String {
        case brand = "fa-brands-400"
        case regular = "fa-regular-400"
        case solid = "fa-solid-900"
        
        public var file: String {
            return rawValue
        }
        
        public var name: String {
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
                return "FontAwesome5BrandsRegular"
            case .regular:
                return "FontAwesome5FreeRegular"
            case .solid:
                return "FontAwesome5FreeSolid"
            }
        }
    }
    
}


class Fonts {
    
    static func load(type: Awesome.Font) {
        #if os(iOS) || os(watchOS) || os(tvOS)
        if (!Font.fontNames(forFamilyName: type.name).contains(type.memberName)) {
            let bundle = Bundle(for: Fonts.self)
            var fontURL: URL!
            let identifier = bundle.bundleIdentifier
            
            if identifier?.hasPrefix("org.cocoapods") == true {
                fontURL = bundle.url(forResource: type.file, withExtension: "ttf", subdirectory: "Awesome.bundle")
            }
            else {
                fontURL = bundle.url(forResource: type.file, withExtension: "ttf")
            }
            let data = try! Data(contentsOf: fontURL as URL)
            let provider = CGDataProvider(data: data as CFData)
            let font = CGFont(provider!)
            
            print("Registering: \(font!.fullName!)")
            
            var error: Unmanaged<CFError>?
            
            if CTFontManagerRegisterGraphicsFont(font!, &error) == false {
                let errorDescription: CFString = CFErrorCopyDescription(error!.takeUnretainedValue())
                let nsError = error!.takeUnretainedValue() as AnyObject as! NSError
                NSException(name: NSExceptionName.internalInconsistencyException, reason: errorDescription as String, userInfo: [NSUnderlyingErrorKey: nsError]).raise()
            }
        }
        #elseif os(OSX)
        
        #endif
        
    }
    
}
