//
//  ViewController.swift
//  FASwift
//
//  Created by Ondrej Rafaj on 10/13/2017.
//  Copyright (c) 2017 Ondrej Rafaj. All rights reserved.
//

import UIKit
import Presentables
import FASwift


class ViewController: UITableViewController {
    
    let dataController = DataManager()
    
    
    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Font Awesome 5"
        
        var dc: PresentableManager = dataController
        tableView.bind(withPresentableManager: &dc)
    }

}

