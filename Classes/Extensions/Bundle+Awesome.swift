//
//  File.swift
//  
//
//  Created by CEX on 08/09/21.
//

import Foundation


private class MyBundleFinder {}

extension Bundle {
    
    static var resource: Bundle = {
        let moduleName = "Awesome"
        #if COCOAPODS
        let bundleName = moduleName
        #else
        let bundleName = "\(moduleName)_\(moduleName)"
        #endif
        
        let candidates = [
            // Bundle should be present here when the package is linked into an App.
            Bundle.main.resourceURL,
            
            // Bundle should be present here when the package is linked into a framework.
            Bundle(for: MyBundleFinder.self).resourceURL,
            
            // For command-line tools.
            Bundle.main.bundleURL,
        ]
        
        for candidate in candidates {
            let bundlePath = candidate?.appendingPathComponent(bundleName + ".bundle")
            if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
                return bundle
            }
        }
        
        fatalError("Unable to find bundle named \(bundleName)")
    }()
}
