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
    
    convenience init<AmazingType: Amazing>(icon: AmazingType, fontSize: CGFloat, color: Color = .black, backgroundColor: Color = .clear) {
        Fonts.load(type: icon.fontType)
        
        guard let font = Font(name: icon.fontType.memberName, size: fontSize) else {
            fatalError("Font \(icon.fontType.memberName) not loaded properly. Did you forget to call AwesomePro.loadFonts(from:)?")
        }
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        let attributes = [NSAttributedString.Key.font: font, .foregroundColor: color, .backgroundColor: backgroundColor, .paragraphStyle: paragraph]
        
        self.init(string: icon.rawValue, attributes: attributes)
    }
    
}
