//
//  NSAttributedString+Awesome.swift
//  Awesome
//
//  Created by Ondrej Rafaj on 15/10/2017.
//

import Foundation
import UIKit


public extension NSAttributedString {
    
    public static func awesome(icon: Amazing, fontSize: CGFloat, color: UIColor = UIColor.black, backgroundColor: UIColor = UIColor.clear) -> NSAttributedString {
        Fonts.load(type: icon.fontType)
        
        guard let font = UIFont(name: icon.fontType.name, size: fontSize) else {
            fatalError("Error! Font did not load properly")
        }
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        let attributes = [NSAttributedStringKey.font: font, .foregroundColor: color, .backgroundColor: backgroundColor, .paragraphStyle: paragraph]
        
        let attributedString = NSAttributedString(string: icon.code, attributes: attributes)
        
        return attributedString
    }
    
}
