//
//  FA+UIImage.swift
//  FASwift
//
//  Created by Ondrej Rafaj on 13/10/2017.
//  Copyright © 2017 manGoweb UK. All rights reserved.
//

import Foundation


public extension UIImage {
    
    public convenience init(icon: Type, size: CGSize, color: UIColor = UIColor.black, backgroundColor: UIColor = UIColor.clear) {
        let fontType: Font = .light
        Fonts.load(type: fontType)
        
        let fontAspectRatio: CGFloat = 1.28571429
        let fontSize = min(size.width / fontAspectRatio, size.height)
        
        guard let font = UIFont(name: fontType.name, size: fontSize) else {
            fatalError("Error! Font did not load properly")
        }
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        let attributes = [NSAttributedStringKey.font: font, .foregroundColor: color, .backgroundColor: backgroundColor, .paragraphStyle: paragraph]
        
        let attributedString = NSAttributedString(string: icon.code, attributes: attributes)
        UIGraphicsBeginImageContextWithOptions(size, false , 0.0)
        attributedString.draw(in: CGRect(x: 0, y: (size.height - fontSize) * 0.5, width: size.width, height: fontSize))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        if let image = image {
            let imageOrientation = image.imageOrientation
            self.init(cgImage: image.cgImage!, scale: image.scale, orientation: imageOrientation)
        } else {
            self.init()
        }
    }
    
    public convenience init(topIcon: Type, bottomIcon: Type, topIconColor: UIColor = .black, bottomIconColor: UIColor = .black, backgroundColor: UIColor = .clear, bottomIconBigger: Bool? = true, size: CGSize? = nil) {
        
        let bgSize: CGSize!
        let topSize: CGSize!
        let bgRect: CGRect!
        let topRect: CGRect!
        
        if bottomIconBigger! {
            topSize = size ?? CGSize(width: 30, height: 30)
            bgSize = CGSize(width: 2 * topSize.width, height: 2 * topSize.height)
        }
        else {
            bgSize = size ?? CGSize(width: 30, height: 30)
            topSize = CGSize(width: 2 * bgSize.width, height: 2 * bgSize.height)
        }
        
        let bgImage = UIImage(icon: bottomIcon, size: bgSize, color: bottomIconColor)
        let topImage = UIImage(icon: topIcon, size: topSize, color: topIconColor)
        
        if bottomIconBigger! {
            bgRect = CGRect(x: 0, y: 0, width: bgSize.width, height: bgSize.height)
            topRect = CGRect(x: topSize.width/2, y: topSize.height/2, width: topSize.width, height: topSize.height)
            UIGraphicsBeginImageContextWithOptions(bgImage.size, false, 0.0)
        }
        else {
            topRect = CGRect(x: 0, y: 0, width: topSize.width, height: topSize.height)
            bgRect = CGRect(x: bgSize.width/2, y: bgSize.height/2, width: bgSize.width, height: bgSize.height)
            UIGraphicsBeginImageContextWithOptions(topImage.size, false, 0.0)
            
        }
        
        bgImage.draw(in: bgRect)
        topImage.draw(in: topRect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        if let image = image {
            let imageOrientation = image.imageOrientation
            self.init(cgImage: image.cgImage!, scale: image.scale, orientation: imageOrientation)
        }
        else {
            self.init()
        }
    }
    
}

