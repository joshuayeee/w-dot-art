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
    
    init(username: String, password: String, email: String) {
        self.my_username = username
        self.my_password = password
        self.my_email = email
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
    
}
