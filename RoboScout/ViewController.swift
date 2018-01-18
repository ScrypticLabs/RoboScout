//
//  ViewController.swift
//  RoboScout
//
//  Created by Abhi Gupta on 2015-03-07.
//  Copyright (c) 2015 AbhiGupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scrollView.contentSize.height = 1000
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

