//
//  FASwift.swift
//  FASwift
//
//  Created by Ondrej Rafaj on 13/10/2017.
//  Copyright © 2017 manGoweb UK. All rights reserved.
//

import Foundation


public struct AwesomableProperty<T> {
    
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

public protocol Awesomable {
    
    associatedtype ThemablePropertyParentType
    var fa: AwesomableProperty<ThemablePropertyParentType> { get }
    
}


extension Awesomable {
    
    public var fa: AwesomableProperty<Self> {
        get {
            return AwesomableProperty(self)
        }
    }
    
}


extension UIImage: Awesomable { }
