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
        
        var section = PresentableSection()
        for type in Awesome.brand.all {
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
        data.append(section)
        
        section = PresentableSection()
        for type in Awesome.light.all {
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
        data.append(section)
        
        section = PresentableSection()
        for type in Awesome.regular.all {
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
        data.append(section)
        
        section = PresentableSection()
        for type in Awesome.solid.all {
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
        data.append(section)
    }
    
    // MARK: Table datasource & delegate methods
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Brands"
        case 1:
            return "Light"
        case 2:
            return "Regular"
        case 3:
            return "Solid"
        default:
            fatalError("There should be only 4 sections")
        }
    }
    
}
