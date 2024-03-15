//
//  CardView.swift
//  CardGame
//
//  Created by Kyle on 2024/3/8.
//

import SwiftUI

struct CardView: View {
    let card: MemoryGame<String>.Card
    @State var isFaceUp = false
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }

    var body: some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: 15)
            
            Group{
                base.fill(.white)
                base.strokeBorder(style: StrokeStyle(lineWidth: 1))
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.1)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1: 0)
            base
                .fill(.orange)
                .opacity(card.isFaceUp ? 0 : 1)
        }
    }
}


