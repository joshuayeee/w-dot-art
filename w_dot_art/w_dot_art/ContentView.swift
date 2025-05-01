//
//  ContentView.swift
//  cpsc411_finalproject
//
//  Created by csuftitan on 4/17/25.
//

import SwiftUI

// HOME
struct ContentView: View {
    @StateObject var cartManager = CartManager()
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color(.black)
                    .ignoresSafeArea() // Ensures background covers the entire screen
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                        ForEach(sampleArtworks) { art in // Iterate over artwork data
                            NavigationLink(destination: ArtDetailView(art: art, cartManager: cartManager)) {
                                VStack { // Stack each image and title vertically
                                    Image(art.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .cornerRadius(5)
                                        .frame(height: 120)
                                    Text(art.title)
                                        .font(.system(size: 16))
                                        .foregroundStyle(.white)
                                        .padding(.top, 4)
                                }
                                .padding() // Padding inside each grid item
                            }
                        }
                    }
                }
                .navigationTitle("Free Art Gallery")
                .toolbarBackground(Color(.white), for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbar {
                    NavigationLink(destination: CartView(cartManager: cartManager)) {
                        HStack {
                            Image(systemName: "cart")
                            Text("\(cartManager.cartItems.count)")// Number of items in the cart
                                .font(.caption)
                        }
                    }
                }
            }
        }
    }
}

struct ArtDetailView: View {
    let art: Art
    @ObservedObject var cartManager: CartManager // Observes the cart manager for state updates
    @Environment(\.presentationMode) var presentationMode // Used to dismiss the current view

    var body: some View {
        VStack(spacing: 20) {
            // Display the artwork image
            Image(art.imageName)
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .padding()

            // Display the artwork title
            Text(art.title)
                .font(.title)
                .bold()

            // Add to Cart button
            Button(action: {
                cartManager.addToCart(art)
                presentationMode.wrappedValue.dismiss() // Close the detail view after adding
            }) {
                Text("Add to Cart")
                    .fontWeight(.semibold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .padding(.horizontal)
            }

            Spacer()
        }
        .navigationTitle("Artwork")
        .toolbarBackground(Color(.white), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

struct CartView: View {
    @ObservedObject var cartManager: CartManager // Observes changes to the cart state

    var body: some View {
        VStack {
            // If the cart is empty, show a message
            if cartManager.cartItems.isEmpty {
                Text("Your cart is empty.")
                    .font(.headline)
                    .padding()
            } else {
                // Otherwise, show the list of items in the cart
                List {
                    ForEach(cartManager.cartItems) { art in
                        HStack {
                            Image(art.imageName)
                                .resizable()
                                .frame(width: 60, height: 60)
                                .cornerRadius(8)

                            VStack(alignment: .leading) {
                                Text(art.title)
                                Button("Remove") {
                                    cartManager.removeFromCart(art)
                                }
                                .foregroundColor(.red)
                                .font(.caption)
                            }
                        }
                    }
                }

                Button(action: {
                    for art in cartManager.cartItems {
                        if let uiImage = UIImage(named: art.imageName),
                           let imageData = uiImage.pngData() {

                            let fileName = "\(art.title).png"
                            let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(fileName)

                            do {
                                try imageData.write(to: fileURL)
                                print("Saved \(fileName) to \(fileURL)")
                            } catch {
                                print("Failed to save \(fileName): \(error)")
                            }
                        } else {
                            print("Image not found for \(art.imageName)")
                        }
                    }

                    cartManager.clearCart()
                }) {
                    Text("Download All (\(cartManager.cartItems.count))")
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding()
                }
            }
        }
        .navigationTitle("Your Cart")
        .toolbarBackground(Color(.white), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

#Preview {
    ContentView()
}

