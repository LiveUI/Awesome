//
//  BaseIcon.swift
//  
//
//  Created by Kingtak Justin Wong on 9/19/22.
//

import Foundation

protocol BaseIcon<T> {
    associatedtype T: Hashable

    var name: String { get set }
    var unicode: String { get set }
    
    var free: [T] { get set }
    var pro: [T] { get set }
}

