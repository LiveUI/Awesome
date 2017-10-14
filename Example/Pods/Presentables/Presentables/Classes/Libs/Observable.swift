//
//  Observable.swift
//  Presentables
//
//  Created by Ondrej Rafaj on 24/07/2017.
//  Copyright © 2017 manGoweb UK Ltd. All rights reserved.
//

import Foundation


open class Observable<T> {
    
    public typealias Listener = (T) -> Void
    
    var listener: Listener?
    
    open func bind(listener: Listener?) {
        self.listener = listener
    }
    
    open func bindAndFire(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
    
    open var value: T {
        didSet {
            listener?(value)
        }
    }
    
    public init(_ v: T) {
        value = v
    }
    
}
