//
//  EmojiMemoryGameView.swift
//  CardGame
//
//  Created by Kyle on 2024/3/8.
//

import SwiftUI



struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame

    @State var themeIndex = 0
    
    private let cardAspectRatio: CGFloat = 3/4
    
    var body: some View {
        VStack {
            Text("🍊 Memorize it!")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.orange)
            
            cards
                .animation(.default, value: viewModel.cards)
            Button(action: {
                viewModel.shuffle()
            }){
                VStack{
                    Text("🔀")
                        .font(.custom("SF Pingfang", size: 40))
                    Text("shuffle it!")
                }
            }
        }
        .padding(10)
    }
    
    var cards: some View{
        AspectVGrid(
            viewModel.cards,
            cardAspectRatio: cardAspectRatio
        ){ card in
            CardView(card)
                .aspectRatio(cardAspectRatio, contentMode: .fit)
                .padding(4)
                .onTapGesture {
                    viewModel.choose(card)
                }
        }
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
