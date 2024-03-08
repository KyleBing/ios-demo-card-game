//
//  ContentView.swift
//  CardGame
//
//  Created by Kyle on 2024/3/8.
//

import SwiftUI

struct CardTheme {
    let name: String
    let emojis: String
}

struct ContentView: View {
    let emojiThemes = [
        CardTheme(name: "Normal", emojis: "🚗🌏⏰💎🪙🎾"),
        CardTheme(name: "Animal", emojis: "🐶🦊🐯🦄🐝🐠"),
        CardTheme(name: "Fruit",  emojis: "🍏🍊🥦🍋🌽🍇")
    ]
    
    
    @State var count = 9
    @State var themeIndex = 0

    var body: some View {
        VStack {
            Text("Memorize it!")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.orange)
            ScrollView{
                cards
            }
            Spacer()
            HStack{
                ForEach(emojiThemes.indices, id: \.self){ index in
                    Button(action: {
                        themeIndex = index
                    }) {
                        Text(emojiThemes[index].name)
                    }
                    .font(.title)
                    .bold()
                }
                
            }
        }
        .padding()
    }
    
    var cards: some View{
        let emojis = (emojiThemes[themeIndex].emojis + emojiThemes[themeIndex].emojis)
            .split(separator: "")
            .map{String($0)}
            .shuffled()
        return LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
            ForEach(emojis.indices, id: \.self){ index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
    }
}

#Preview {
    ContentView()
}
