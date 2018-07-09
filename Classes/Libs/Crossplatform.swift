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
    public typealias Image = UIImage
    
#elseif os(OSX)
    
    import Cocoa
    
    public typealias Color = NSColor
    public typealias Font = NSFont
    public typealias Image = NSImage

	extension Font {
		static func fontNames(forFamilyName: String) -> [String] {
			return NSFontManager.shared.availableMembers(ofFontFamily: forFamilyName)?
				.compactMap { return $0.first as? String } ?? []
		}
	}

#endif
