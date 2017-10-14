//
//  UICollectionView+Cells.swift
//  Presentables
//
//  Created by Ondrej Rafaj on 13/07/2017.
//  Copyright © 2017 manGoweb UK Ltd. All rights reserved.
//

import Foundation
import UIKit


extension UICollectionView {
    
    open func register<T>(_ cellClass: T.Type) where T: UICollectionViewCell {
        register(cellClass, forCellWithReuseIdentifier: cellClass.identifier)
    }
    
    open func dequeueReusableCell<T>(withCellClass cellClass: T.Type, for indexPath: IndexPath) -> T where T: UICollectionViewCell {
        let cell: T = dequeueReusableCell(withReuseIdentifier: cellClass.identifier, for: indexPath) as! T
        return cell
    }
    
}
