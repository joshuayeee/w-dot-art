//  Product_Model.swift
//  cpsc411_finalproject
//
//  Created by csuftitan on 4/17/25.
//

import Foundation

struct Art: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    let downloadURL: String
}

import Foundation

let sampleArtworks: [Art] = [
    Art(title: "Apple Face", imageName: "Apple Face", downloadURL: "Apple Face"),
    Art(title: "Bana", imageName: "Bana", downloadURL: "Bana"),
    Art(title: "Big Fork", imageName: "Big Fork", downloadURL: "Big Fork"),
    Art(title: "Big Water", imageName: "Big_Water", downloadURL: "Big_Water.png"),
    Art(title: "brid", imageName: "brid", downloadURL: "brid"),
    Art(title: "Brock O'bama", imageName: "Brock O'bama", downloadURL: "Brock O'bama"),
    Art(title: "cat", imageName: "cat", downloadURL: "cat"),
    Art(title: "Flying Man Touch Hill Man", imageName: "Flying Man Touch Hill Man", downloadURL: "Flying Man Touch Hill Man"),
    Art(title: "gu", imageName: "gu", downloadURL: "gu"),
    Art(title: "Man Playing Wonderwall", imageName: "Man Playing Wonderwall", downloadURL: "Man Playing Wonderwall"),
    Art(title: "Mareo", imageName: "Mareo", downloadURL: "Mareo"),
    Art(title: "Microwaved Clocks", imageName: "Microwaved Clocks", downloadURL: "Microwaved Clocks"),
    Art(title: "Modern", imageName: "Modern", downloadURL: "Modern"),
    Art(title: "Mower Lease Ah", imageName: "Mower_Lease_Ah", downloadURL: "Mower_Lease_Ah.png"),
    Art(title: "Pipe", imageName: "Pipe", downloadURL: "Pipe"),
    Art(title: "Ring Yay", imageName: "Ring Yay", downloadURL: "Ring Yay"),
    Art(title: "Scissor", imageName: "Scissor", downloadURL: "Scissor"),
    Art(title: "The Yell", imageName: "The_Yell", downloadURL: "The_Yell.png"),
    Art(title: "Van Go", imageName: "Van Go", downloadURL: "Van Go")
]

class CartManager: ObservableObject {
    @Published var cartItems: [Art] = []

    func addToCart(_ art: Art) {
        if !cartItems.contains(where: { $0.id == art.id }) {
            cartItems.append(art)
        }
    }

    func removeFromCart(_ art: Art) {
        cartItems.removeAll { $0.id == art.id }
    }

    func clearCart() {
        cartItems.removeAll()
    }
}


