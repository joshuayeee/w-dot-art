//
//  Account.swift
//  w.art
//
//  Created by Joshua Yee on 4/28/25.
//

class Account {
    
    private let my_username: String
    private let my_password: String
    private let my_email: String
    private var signed_in: Bool
    
    init(username: String, password: String, email: String) {
        self.my_username = username
        self.my_password = password
        self.my_email = email
        signed_in = false
        print("account")
    }
    
    func get_username() -> String {
        return my_username
    }
    
    func get_password() -> String {
        return my_password
    }
    
    func get_email() -> String {
        return my_email
    }
    
    func set_signed_in(is_signed_in: Bool) {
        signed_in = is_signed_in
    }
    
}
