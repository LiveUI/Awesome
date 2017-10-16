//
//  ViewController.swift
//  AwesomeTV_Example
//
//  Created by Ondrej Rafaj on 16/10/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import Awesome
import SnapKit


class ViewController: UIViewController {
    
    let imageView = UIImageView()
    
    
    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureImageView()
        
        imageView.image = Awesome.brand.fortAwesome.asImage(size: 300.0)
    }
    
    // MARK: Configuring elements
    
    func configureImageView() {
        view.addSubview(imageView)
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = 20
        imageView.backgroundColor = UIColor(white: 1, alpha: 0.5)
        imageView.contentMode = .center
        imageView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(300)
        }
    }


}

