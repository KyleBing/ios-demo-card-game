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
        GeometryReader{ geometry in
            let gridItemSize = gridItemWidthThatFits(
                count: viewModel.cards.count,
                size: geometry.size,
                atAspectRatio: cardAspectRatio
            )
            LazyVGrid(
                columns: [GridItem(.adaptive(minimum: gridItemSize), spacing: 0)],
                spacing: 0
            ) {
                ForEach(viewModel.cards){ card in
                    CardView(card)
                        .aspectRatio(cardAspectRatio, contentMode: .fit)
                        .padding(4)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
        }
    }
    
    private func gridItemWidthThatFits(
        count: Int,
        size: CGSize,
        atAspectRatio: CGFloat
    ) -> CGFloat {
        let countCards = CGFloat(count)
        var cols: CGFloat = 1.0
        
        repeat {
            let widthCard = size.width / cols
            let heightCard = widthCard / cardAspectRatio
            let rows = (countCards / cols).rounded(.up)
            if heightCard * rows > size.height{
                cols = cols + 1
            } else {
                return widthCard
            }
        } while cols < countCards
        return (size.width / countCards).rounded(.down)
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
