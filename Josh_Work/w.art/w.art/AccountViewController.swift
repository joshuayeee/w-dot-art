//
//  AccountViewController.swift
//  w.art
//
//  Created by Joshua Yee on 4/27/25.
//

import UIKit

class AccountViewController: UIViewController {
    
    private var my_tab: TabController?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        my_tab = tabBarController as? TabController
    }
    
    @IBAction func handle_log_out() {
        my_tab?.log_out_account()
    }
    
    func get_tab() -> TabController {
        return my_tab!
    }

}

