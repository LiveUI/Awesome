//
//  FA+UIImage.swift
//  Awesome
//
//  Created by Ondrej Rafaj on 13/10/2017.
//  Copyright © 2017 manGoweb UK. All rights reserved.
//

import Foundation


public extension UIImage {
    
    public convenience init(icon: Amazing, size: CGSize, color: UIColor = UIColor.black, backgroundColor: UIColor = UIColor.clear) {
        UIGraphicsBeginImageContextWithOptions(size, false , 0.0)
        
        let fontAspectRatio: CGFloat = 1.28571429
        let fontSize = min(size.width / fontAspectRatio, size.height)
        let attributedString = NSAttributedString.awesome(icon: icon, fontSize: fontSize, color: color, backgroundColor: backgroundColor)
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
    
    public convenience init(topIcon: Amazing, bottomIcon: Amazing, topIconColor: UIColor = .black, bottomIconColor: UIColor = .black, backgroundColor: UIColor = .clear, size: CGSize? = nil) {
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
    
}


