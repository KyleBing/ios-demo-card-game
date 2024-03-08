//
//  ContentView.swift
//  CardGame
//
//  Created by Kyle on 2024/3/8.
//

import SwiftUI

struct ContentView: View {
    let emojiClection = "🚗🌏⏰💎"
    var body: some View {
        let emojis = emojiClection.split(separator: "").map{String($0)}
        VStack {
            ForEach(emojis.indices, id: \.self){ index in
                CardView(content: emojis[index])
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
