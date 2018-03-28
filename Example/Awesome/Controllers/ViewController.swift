//
//  ViewController.swift
//  Awesome
//
//  Created by Ondrej Rafaj on 10/13/2017.
//  Copyright (c) 2017 Ondrej Rafaj. All rights reserved.
//

import UIKit
import Presentables
import AwesomeEnum


class ViewController: UITableViewController {
    
    let dataController = DataManager()
    
    
    // MARK: Data
    
    func element(indexPath: IndexPath) -> Amazing {
        switch indexPath.section {
        case 1:
            return Awesome.regular.all[indexPath.row]
        case 2:
            return Awesome.solid.all[indexPath.row]
        default:
            return Awesome.brand.all[indexPath.row]
        }
    }
    
    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Font Awesome 5 Free"
        
        dataController.didTapCell = { info in
            let icon = self.element(indexPath: info.indexPath)
            let c = DetailViewController()
            c.icon = icon
            self.navigationController?.pushViewController(c, animated: true)
        }
        
        var dc: PresentableManager = dataController
        tableView.bind(withPresentableManager: &dc)
    }

}

