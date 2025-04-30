//
//  ArtPiece.swift
//  w.art
//
//  Created by Joshua Yee on 4/28/25.
//

class ArtPiece {
    
    private var art_id: Int
    private var art_name: String
    
    init(art_id: Int, art_name: String) {
        self.art_id = art_id
        self.art_name = art_name
        print("art piece")
    }
    
    func get_art_id() -> Int {
        return art_id
    }
    
    func get_art_name() -> String {
        return art_name
    }
    
}
