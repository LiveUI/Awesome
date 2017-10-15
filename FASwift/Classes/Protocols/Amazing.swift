//
//  Amazing.swift
//  FASwift
//
//  Created by Ondrej Rafaj on 15/10/2017.
//

import Foundation


public protocol Amazing {
    
    init?(rawValue: String)
    
    var code: String { get }
    
    static var keys: [String] { get }
    static var labels: [String] { get }
    
    var fontType: Awesome.Font { get }
    
    var name: String { get }
    var label: String { get }

}


public extension Amazing {
    
    public func asImage(size: CGSize, color: UIColor = UIColor.black, backgroundColor: UIColor = UIColor.clear) -> UIImage {
        return UIImage.init(icon: self, size: size, color: color, backgroundColor: backgroundColor)
    }
    
    public func asAttributedText(fontSize: CGFloat, color: UIColor = UIColor.black, backgroundColor: UIColor = UIColor.clear) -> NSAttributedString {
        return NSAttributedString.awesome(icon: self, fontSize: fontSize, color: color, backgroundColor: backgroundColor)
    }
    
}
