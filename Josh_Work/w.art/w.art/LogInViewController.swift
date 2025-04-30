//
//  LogInViewController.swift
//  w.art
//
//  Created by Joshua Yee on 4/27/25.
//

import UIKit

class LogInViewController : UIViewController {
    
    private var my_tab: TabController?
    
    @IBOutlet var username_field: UITextField?
    @IBOutlet var password_field: UITextField?
    @IBOutlet var tab_bar: TabController?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        my_tab = presentingViewController as? TabController
    }
    
    @IBAction func handleLogInButton(_ sender: UIButton) {
        let username_text: String = username_field!.text!
        let password_text: String = password_field!.text!
        
        my_tab?.check_for_account(username: username_text, password: password_text)
    }
    
}
