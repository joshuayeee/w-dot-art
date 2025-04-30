//
//  SignUpViewController.swift
//  w.art
//
//  Created by Joshua Yee on 4/27/25.
//

import UIKit

class SignUpViewController : UIViewController {
    
    private var my_tab: TabController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        my_tab = presentingViewController as? TabController
    }
    
}
