//
//  ContentView.swift
//  swiftUIButton0428
//
//  Created by paohua hsu on 2025/4/28.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        Button(action: {
                    print("Hello World tapped!")
                }) {
                    Text("Hello World")
                        .fontWeight(.bold)
                        .font(.title)
                        .padding()
                        .background(Color.purple)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color.purple, lineWidth: 5)
                        )
                }
        Button(action: {
            print("Delete button tapped!")
        }) {
            Image(systemName: "trash")
                .font(.largeTitle)
                .foregroundColor(.red)
        }
    }

}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
