//
//  PresentableManager.swift
//  Presentables
//
//  Created by Ondrej Rafaj on 28/07/2017.
//  Copyright © 2017 manGoweb UK Ltd. All rights reserved.
//

import Foundation


public protocol PresentableManager {
    
    var bindableData: Observable<PresentableSections> { get }
    var data: PresentableSections { get set }
    
    var needsReloadData: (()->())? { get set }
    
}
