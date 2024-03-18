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
    
    var body: some View {
        VStack {
            VStack{
                Text("🍇")
                    .font(.custom("SF UI Display", size: CGFloat(60.0)))
                Text("Fruits")
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
                    .animation(.default, value: viewModel.cards)
            }
            Spacer()
            Button(action: {
                viewModel.shuffle()
            }){
                VStack{
                    Text("🔀")
                        .font(.custom("SF Pingfang", size: 50))
                    Text("shuffle it!")
                }
            }
//            HStack{
//ForEach(EmojiMemoryGame.emojiThemes.indices, id: \.self){ index in
//                    Button(action: {
//                        themeIndex = index
//                    }) {
//                        VStack{
//                            Text(EmojiMemoryGame.emojiThemes[index].icon)
//                                .font(.custom("SF Pingfang", size: 50))
//                            Text(EmojiMemoryGame.emojiThemes[index].name)
//                        }
//                    }
//                    .padding(10)
//                    .font(.custom("Galvji", size: CGFloat(20.0)))
//                    .foregroundColor(.black)
//                }
//            }
        }
        .padding()
    }
    
    var cards: some View{
        return LazyVGrid(
            columns: [GridItem(.adaptive(minimum: 65), spacing: 0)],
            spacing: 0
        ) {
            ForEach(viewModel.cards){ card in
                CardView(card)
                    .aspectRatio(4/5, contentMode: .fit)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        }
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
