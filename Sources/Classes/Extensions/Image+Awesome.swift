//
//  Image+Awesome.swift
//  Awesome
//
//  Created by Ondrej Rafaj on 13/10/2017.
//  Copyright © 2017 manGoweb UK. All rights reserved.
//

import Foundation
#if os(iOS) || os(watchOS) || os(tvOS)
    import UIKit
#elseif os(OSX)
    import Cocoa
#endif


public extension Image {
    
    convenience init<AmazingType: Amazing>(icon: AmazingType, size: CGSize, color: Color = .black, backgroundColor: Color = .clear) {
        let fontAspectRatio: CGFloat = 1.28571429
        let fontSize = min(size.width / fontAspectRatio, size.height)
        let attributedString = NSAttributedString(icon: icon, fontSize: fontSize, color: color, backgroundColor: backgroundColor)
        
        #if os(iOS) || os(watchOS) || os(tvOS)
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
        #elseif os(OSX)
            let boxSize: NSSize = attributedString.size()
            let rect = NSRect(x: 0, y: 0, width: boxSize.width, height: boxSize.height)
            let image = NSImage(size: boxSize)
            image.lockFocus()
            backgroundColor.set()
            rect.fill()
            attributedString.draw(in: rect)
            image.unlockFocus()
            
			if let cgImage = image.cgImage(forProposedRect: nil, context: nil, hints: nil) {
				self.init(cgImage: cgImage, size: boxSize)
			} else {
				self.init()
			}
        #endif
    }
    
    convenience init<AmazingType:Amazing>(icon: AmazingType, size: CGFloat, color: Color = .black, backgroundColor: Color = .clear) {
        self.init(icon: icon, size: CGSize.init(width: size, height: size), color: color, backgroundColor: backgroundColor)
    }
    
    
    #if os(iOS) || os(watchOS) || os(tvOS)
    
    convenience init<AmazingType:Amazing>(topIcon: AmazingType, bottomIcon: AmazingType, topIconColor: Color = .black, bottomIconColor: Color = .black, backgroundColor: Color = .clear, size: CGSize? = nil) {
        let bgSize: CGSize = size ?? CGSize(width: 32, height: 32)
        let topSize: CGSize = CGSize(width: 2 * bgSize.width, height: 2 * bgSize.height)
        
        let topRect: CGRect = CGRect(x: 0, y: 0, width: topSize.width, height: topSize.height)
        let bgRect: CGRect = CGRect(x: bgSize.width/2, y: bgSize.height/2, width: bgSize.width, height: bgSize.height)
        
        let bgImage = UIImage(icon: bottomIcon, size: bgSize, color: bottomIconColor)
        let topImage = UIImage(icon: topIcon, size: topSize, color: topIconColor)
        
        UIGraphicsBeginImageContextWithOptions(topImage.size, false, 0.0)
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
    
    #endif
    
}
