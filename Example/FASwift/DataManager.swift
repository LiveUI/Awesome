//
//  DataManager.swift
//  FASwift_Example
//
//  Created by Ondrej Rafaj on 14/10/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import Presentables
import FASwift


class DataManager: PresentableTableViewDataManager {
    
    // MARK: Initialization
    
    override init() {
        super.init()
        
        let section = PresentableSection()
        
        // Create some basic cells
        for type in Type.all() {
            let presenter = IconTableViewCellPresenter()
            presenter.configure = { presentable in
                guard let cell = presentable as? IconTableViewCell else {
                    return
                }
                cell.textLabel?.text = type.name
                cell.imageView?.image = UIImage.init(icon: type, size: CGSize(width: 30, height: 30))
            }
            section.presenters.append(presenter)
        }
        
        // Add section to the data set
        data.append(section)
    }
    
    // MARK: Table datasource & delegate methods
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
}
