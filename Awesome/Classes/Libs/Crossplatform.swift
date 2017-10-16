//
//  Crossplatform.swift
//  Pods
//
//  Created by Ondrej Rafaj on 16/10/2017.
//

import Foundation

#if os(iOS) || os(watchOS) || os(tvOS)
    
    import UIKit
    
    public typealias Color = UIColor
    public typealias Font = UIFont
    
#elseif os(OSX)
    
    import Cocoa
    
    public typealias Color = NSColor
    public typealias Font = NSFont
    
#endif
