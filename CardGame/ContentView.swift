//
//  ContentView.swift
//  CardGame
//
//  Created by Kyle on 2024/3/8.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView(isFaceUp: true)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
