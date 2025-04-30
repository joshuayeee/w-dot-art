//
//  TabController.swift
//  w.art
//
//  Created by Joshua Yee on 4/27/25.
//

import UIKit
import GRDB

class TabController : UITabBarController {
    
    private var dbQueue: DatabaseQueue?
    
    private var accounts: Array<Account>?
    private var art_pieces: Array<ArtPiece>?
    private var account_art: Array<AccountArt>?
    
    private var user_account: Account?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("lol")
        dbQueue = try? getDatabaseQueue()
        loadAllData()
        print("lol2")
    }
    
    override func setViewControllers(_ viewControllers: [UIViewController]?, animated: Bool) {
        super.setViewControllers(viewControllers, animated: animated)
        print("lol3")
    }
    
    private func getDatabaseQueue() throws -> DatabaseQueue {
        let fileManager = FileManager.default
        
        let dbPath = try fileManager.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("wdotartdb.db").path
        
        if !fileManager.fileExists(atPath: dbPath) {
            let dbResourcePath = Bundle.main.path(forResource: "wdotartdb", ofType: "db")!
            
            try fileManager.copyItem(atPath: dbResourcePath, toPath: dbPath)
        }
        
        return try DatabaseQueue(path: dbPath)
    }
    
    
    private func loadAllData() {
        accounts = []
        art_pieces = []
        account_art = []
        
        try? dbQueue?.read { db in
            
            let accountRows = try Row.fetchAll(db, sql: "SELECT my_username, my_password, my_email FROM my_accounts")
            
            let artPieceRows = try Row.fetchAll(db, sql: "SELECT art_id, art_name FROM art_pieces")
            
            let accountArtRows = try Row.fetchAll(db, sql: "SELECT my_username, art_id FROM account_art")
            
            
            for row in accountRows {
                accounts!.append(Account(username: row[0], password: row[1], email: row[2]))
            }
            
            for row in artPieceRows {
                art_pieces!.append(ArtPiece(art_id: row[0], art_name: row[1]))
            }
            
            for row in accountArtRows {
                account_art!.append(AccountArt(my_username: row[0], art_id: row[1]))
            }
        }
    }
    
    func check_for_account(username: String, password: String) {
        if (user_account == nil) {
            for account in accounts! {
                if (username == account.get_username()) {
                    if (password == account.get_password()) {
                        user_account = account
                    }
                    else {
                        print("wrong password")
                    }
                }
                else {
                    print("wrong username")
                }
            }
        }
        else {
            print("already signed in")
        }
    }
    
    func log_out_account() {
        if (user_account != nil) {
            user_account = nil
        }
        else {
            print("not logged in")
        }
    }
    
}
