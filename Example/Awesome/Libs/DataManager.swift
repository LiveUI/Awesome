//
//  DataManager.swift
//  Awesome_Example
//
//  Created by Ondrej Rafaj on 14/10/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import Presentables
import AwesomeEnum


class DataManager: PresentableTableViewDataManager {
    
    // MARK: Initialization
    
    override init() {
        super.init()
        
        func configure(cell presentable: Presentable, type: Amazing) {
            guard let cell = presentable as? IconTableViewCell else {
                return
            }
            cell.textLabel?.text = type.name
            cell.detailTextLabel?.text = type.label
            cell.imageView?.image = UIImage(icon: type, size: CGSize(width: 30, height: 30))
        }
        
        var section = PresentableSection()
        for type in Awesome.brand.all {
            let presenter = IconTableViewCellPresenter()
            presenter.configure = { presentable in
                configure(cell: presentable, type: type)
            }
            section.presenters.append(presenter)
        }
        data.append(section)
        
        section = PresentableSection()
        for type in Awesome.regular.all {
            let presenter = IconTableViewCellPresenter()
            presenter.configure = { presentable in
                configure(cell: presentable, type: type)
            }
            section.presenters.append(presenter)
        }
        data.append(section)
        
        section = PresentableSection()
        for type in Awesome.solid.all {
            let presenter = IconTableViewCellPresenter()
            presenter.configure = { presentable in
                configure(cell: presentable, type: type)
            }
            section.presenters.append(presenter)
        }
        data.append(section)
    }
    
    // MARK: Table datasource & delegate methods
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }
    
    var sectionTitles = ["Brands", "Regular", "Solid"]
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return ["B", "R", "S"]
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
}
