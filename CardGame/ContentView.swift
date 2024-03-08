//
//  ContentView.swift
//  CardGame
//
//  Created by Kyle on 2024/3/8.
//

import SwiftUI

struct ContentView: View {
    let emojiClection = "🚗🌏⏰💎🪙✏️❤️"
    @State var count = 4

    var body: some View {
        VStack {
            ScrollView{
                cards
            }
            Spacer()
            HStack{
                buttonRemove
                Spacer()
                buttonAdd
            }
        }
        .padding()
    }
    
    func adjustButton(by offset: Int, label: String) -> some View{
        let emojis = emojiClection.split(separator: "").map{String($0)}
        return Button(action: {
            count += offset
        }, label: {
            Image(systemName: label)
        })
        .imageScale(.large)
        .disabled(count + offset <= 1 || count + offset > emojis.count)
    }
    
    var buttonRemove: some View{
        adjustButton(by: -1, label: "minus.square")
    }
    
    var buttonAdd: some View{
        adjustButton(by: 1, label: "plus.app")
    }
    

    
    var cards: some View{
        let emojis = emojiClection.split(separator: "").map{String($0)}
        return LazyVGrid(columns: [GridItem(.adaptive(minimum: 90))]) {
            ForEach(1..<count, id: \.self){ index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
    }
}

#Preview {
    ContentView()
}
