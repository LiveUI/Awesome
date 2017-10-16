//
//  NSAttributedString+Awesome.swift
//  Awesome
//
//  Created by Ondrej Rafaj on 15/10/2017.
//

import Foundation
#if os(iOS) || os(watchOS) || os(tvOS)
    import UIKit
#elseif os(OSX)
    import Cocoa
#endif


public extension NSAttributedString {
    
    public static func awesome(icon: Amazing, fontSize: CGFloat, color: Color = Color.black, backgroundColor: Color = Color.clear) -> NSAttributedString {
        Fonts.load(type: icon.fontType)
        
        guard let font = Font(name: icon.fontType.name, size: fontSize) else {
            fatalError("Error! Font did not load properly")
        }
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        let attributes = [NSAttributedStringKey.font: font, .foregroundColor: color, .backgroundColor: backgroundColor, .paragraphStyle: paragraph]
        
        let attributedString = NSAttributedString(string: icon.code, attributes: attributes)
        
        return attributedString
    }
    
}
