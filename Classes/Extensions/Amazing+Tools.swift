//
//  Amazing+Tools.swift
//  Awesome
//
//  Created by Ondrej Rafaj on 14/10/2017.
//  Copyright © 2017 manGoweb UK. All rights reserved.
//

import Foundation
import CoreGraphics

public extension Amazing {
    
    public func asImage(size: CGSize, color: Color = Color.black, backgroundColor: Color = Color.clear) -> Image {
        return Image(icon: self, size: size, color: color, backgroundColor: backgroundColor)
    }
    
    public func asImage(size: CGFloat, color: Color = Color.black, backgroundColor: Color = Color.clear) -> Image {
        return Image(icon: self, size: CGSize(width: size, height: size), color: color, backgroundColor: backgroundColor)
    }
    
    public func asAttributedText(fontSize: CGFloat, color: Color = Color.black, backgroundColor: Color = Color.clear) -> NSAttributedString {
        return NSAttributedString.awesome(icon: self, fontSize: fontSize, color: color, backgroundColor: backgroundColor)
    }
    
}

extension Awesome {
    @available(*, deprecated, renamed: "Brand")
    public typealias brand = Awesome.Brand
    
    @available(*, deprecated, renamed: "Regular")
    public typealias regular = Awesome.Regular
    
    @available(*, deprecated, renamed: "Solid")
    public typealias solid = Awesome.Solid
}

extension AwesomePro {
    @available(*, deprecated, renamed: "Brand")
    public typealias brand = AwesomePro.Brand
    
    @available(*, deprecated, renamed: "Regular")
    public typealias regular = AwesomePro.Regular
    
    @available(*, deprecated, renamed: "Solid")
    public typealias solid = AwesomePro.Solid
    
    @available(*, deprecated, renamed: "Light")
    public typealias light = AwesomePro.Light
}

extension Awesome.Brand {
    
    @available(swift, deprecated: 4.2, message: "This will be removed in the future. Please use .allCases instead")
    public static var all: [Awesome.brand] {
        return allCases
    }
        
}

extension Awesome.Regular {
    
    @available(swift, deprecated: 4.2, message: "This will be removed in the future. Please use .allCases instead")
    public static var all: [Awesome.regular] {
        return allCases
    }
    
}

extension Awesome.Solid {
    
    @available(swift, deprecated: 4.2, message: "This will be removed in the future. Please use .allCases instead")
    public static var all: [Awesome.solid] {
        return allCases
    }
    
}

extension AwesomePro.Brand {
    
    @available(swift, deprecated: 4.2, message: "This will be removed in the future. Please use .allCases instead")
    public static var all: [AwesomePro.brand] {
        return allCases
    }
    
}

extension AwesomePro.Regular {
    
    @available(swift, deprecated: 4.2, message: "This will be removed in the future. Please use .allCases instead")
    public static var all: [AwesomePro.regular] {
        return allCases
    }
    
}

extension AwesomePro.Solid {
    
    @available(swift, deprecated: 4.2, message: "This will be removed in the future. Please use .allCases instead")
    public static var all: [AwesomePro.solid] {
        return allCases
    }
    
}

extension AwesomePro.Light {
    
    @available(swift, deprecated: 4.2, message: "This will be removed in the future. Please use .allCases instead")
    public static var all: [AwesomePro.light] {
        return allCases
    }
    
}
