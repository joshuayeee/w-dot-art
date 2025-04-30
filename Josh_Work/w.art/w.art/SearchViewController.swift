//
//  SearchViewController.swift
//  w.art
//
//  Created by Joshua Yee on 4/27/25.
//

import UIKit

class SearchViewController: UIViewController {
    
    private var my_tab: TabController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        my_tab = tabBarController as? TabController
    }
    
}
