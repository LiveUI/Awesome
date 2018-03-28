//
//  DetailViewController.swift
//  Awesome_Example
//
//  Created by Ondrej Rafaj on 16/10/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import AwesomeEnum
import SnapKit


class DetailViewController: UIViewController {
    
    let imageScrollView = UIScrollView()
    let fontScrollView = UIScrollView()
    
    var icon: Amazing! {
        didSet {
            title = icon.label
        }
    }
    
    // MARK: View lifecycle
    
    var icons: [UIImageView] = []
    
    func addImageIcon(forSize size: CGFloat) {
        let image = icon.asImage(size: CGSize(width: size, height: size))
        let iv = UIImageView(image: image)
        iv.contentMode = .bottom
        imageScrollView.addSubview(iv)
        icons.append(iv)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        
        // Images
        imageScrollView.backgroundColor = .white
        view.addSubview(imageScrollView)
        imageScrollView.snp.makeConstraints { (make) in
            make.top.equalTo(100)
            make.left.right.equalToSuperview()
            make.height.equalTo(220)
        }
        
        addImageIcon(forSize: 180)
        addImageIcon(forSize: 120)
        addImageIcon(forSize: 80)
        addImageIcon(forSize: 60)
        addImageIcon(forSize: 40)
        addImageIcon(forSize: 30)
        addImageIcon(forSize: 20)
        addImageIcon(forSize: 15)
        addImageIcon(forSize: 8)
        
        var lastIcon: UIImageView?
        for icon in icons {
            icon.snp.makeConstraints { (make) in
                make.top.equalTo(20)
                make.bottom.equalTo(imageScrollView)
                make.width.equalTo(icon.image!.size.width)
                if lastIcon == nil {
                    make.left.equalTo(0)
                }
                else {
                    make.left.equalTo(lastIcon!.snp.right).offset(10)
                }
                
                if icon == icons.last {
                    make.right.equalToSuperview()
                }
            }
            lastIcon = icon
        }
        
        // Fonts
        fontScrollView.backgroundColor = .white
        view.addSubview(fontScrollView)
        fontScrollView.snp.makeConstraints { (make) in
            make.top.equalTo(imageScrollView.snp.bottom).offset(1)
            make.left.right.equalToSuperview()
            make.height.equalTo(50)
        }
        
        let label = UILabel()
        fontScrollView.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.left.top.bottom.equalTo(fontScrollView)
        }
    }
}
