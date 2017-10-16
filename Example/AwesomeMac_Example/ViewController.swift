//
//  ViewController.swift
//  AwesomeMac_Example
//
//  Created by Ondrej Rafaj on 16/10/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Cocoa
import Awesome


class ViewController: NSViewController {
    
    @IBOutlet var imageView: NSImageView!
    
    
    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.layer?.borderWidth = 1
        imageView.layer?.borderColor = NSColor.gray.cgColor
        imageView.image = Awesome.brand.fortAwesome.asImage(size: 100)
    }

}

