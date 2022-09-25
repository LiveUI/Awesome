//
//  String.swift
//  
//
//  Created by Kingtak Justin Wong on 9/24/22.
//

import Foundation

typealias ByteArray = [UInt8]

extension String {
    func bytes() -> ByteArray? {
        let length = count
        if length & 1 != 0 {
            return nil
        }
        var bytes = ByteArray()
        bytes.reserveCapacity(length / 2)
        var index = startIndex
        for _ in 0..<length / 2 {
            let nextIndex = self.index(index, offsetBy: 2)
            if let byte = UInt8(self[index..<nextIndex], radix: 16) {
                bytes.append(byte)
            } else {
                return nil
            }
            index = nextIndex
        }
        return bytes
    }
}
