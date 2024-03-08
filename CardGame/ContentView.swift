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
    let icon: String
}

struct ContentView: View {
    let emojiThemes = [
        CardTheme(name: "Normal", emojis: "🚗🌏⏰💎🪙🎾", icon: "🚗"),
        CardTheme(name: "Animal", emojis: "🐶🦊🐯🦄🐝🐠", icon: "🐶"),
        CardTheme(name: "Fruit",  emojis: "🍏🍊🥦🍋🌽🍇", icon: "🍇")
    ]
    
    
    @State var count = 9
    @State var themeIndex = 0

    var body: some View {
        VStack {
            VStack{
                Text(emojiThemes[themeIndex].icon)
                    .font(.custom("SF UI Display", size: CGFloat(60.0)))
                Text(emojiThemes[themeIndex].name)
                    .font(.custom("Galvji", size: CGFloat(20.0)))
            }
            .padding(10)
            
            Text("Memorize it!")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.orange)
            Spacer()
            ScrollView{
                cards
            }
            Spacer()
            HStack{
                ForEach(emojiThemes.indices, id: \.self){ index in
                    Button(action: {
                        themeIndex = index
                    }) {
                        VStack{
                            Text(emojiThemes[index].icon)
                                .font(.custom("SF Pingfang", size: 50))
                            Text(emojiThemes[index].name)
                        }
                        
                    }
                    .padding(10)
                    .font(.custom("Galvji", size: CGFloat(20.0)))
                    .foregroundColor(.black)
                
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
