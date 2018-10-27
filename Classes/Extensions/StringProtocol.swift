//
//  StringProtocol.swift
//  AwesomeEnum-iOS
//
//  Created by Georg on 27.10.18.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import Foundation

extension StringProtocol {
    var firstUppercased: String {
        guard let first = first else { return "" }
        return String(first).uppercased() + dropFirst()
    }
    var firstCapitalized: String {
        guard let first = first else { return "" }
        return String(first).capitalized + dropFirst()
    }
}
