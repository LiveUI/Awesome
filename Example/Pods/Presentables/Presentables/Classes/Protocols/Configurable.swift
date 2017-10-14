//
//  Configurable.swift
//  LUIElements
//
//  Created by Ondrej Rafaj on 24/07/2017.
//  Copyright © 2017 manGoweb UK Ltd. All rights reserved.
//

import Foundation
import UIKit


public protocol Configurable {
    
    var configure: ((Presentable)->())? { get set }
    
}
