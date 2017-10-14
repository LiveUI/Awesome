//
//  IconTableViewCell.swift
//  FASwift_Example
//
//  Created by Ondrej Rafaj on 14/10/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import Presentables


class IconTableViewCell: UITableViewCell, Presentable {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class IconTableViewCellPresenter: Presenter {
    
    var presentable: Presentable.Type = IconTableViewCell.self
    
    var configure: ((Presentable) -> ())?
    
}
