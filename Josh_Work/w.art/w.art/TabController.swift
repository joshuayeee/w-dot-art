//
//  TabController.swift
//  w.art
//
//  Created by Joshua Yee on 4/27/25.
//

import UIKit

class TabController : UITabBarController {
    
    var is_signed_in : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(is_signed_in)
    }

}
