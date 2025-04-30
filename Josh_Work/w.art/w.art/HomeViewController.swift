//
//  HomeViewController.swift
//  w.art
//
//  Created by Joshua Yee on 4/26/25.
//

import UIKit
import GRDB

class HomeViewController: UIViewController {
    
    private var my_tab: TabController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        my_tab = tabBarController as? TabController
    }
}
