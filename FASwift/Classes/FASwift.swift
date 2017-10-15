//
//  FASwift.swift
//  FASwift
//
//  Created by Ondrej Rafaj on 13/10/2017.
//  Copyright © 2017 manGoweb UK. All rights reserved.
//

import Foundation


public struct LovelyProperty<T> {
    
    let element: T
    
    init(_ obj: T) {
        element = obj
    }
    
//    public var and: ThemableProperty<T> {
//        return self
//    }
//
//    public var with: ThemableProperty<T> {
//        return self
//    }
    
}

public protocol Lovely {
    
    associatedtype ThemablePropertyParentType
    var fa: LovelyProperty<ThemablePropertyParentType> { get }
    
}


extension Lovely {
    
    public var fa: LovelyProperty<Self> {
        get {
            return LovelyProperty(self)
        }
    }
    
}


extension UIImage: Lovely { }
