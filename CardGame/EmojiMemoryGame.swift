//
//  EmojiMemorizeGame.swift
//  CardGame
//
//  Created by Kyle on 2024/3/12.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["🚗","🌏","⏰","💎","🪙","🎾","🍏","🍊","🥦","🍋","🌽","🍇"]
    
    // Addition Theme
    static let emojiThemes = [
        EmojiTheme(name: "Normal", emojis: "🚗🌏⏰💎🪙🎾", icon: "🚗"),
        EmojiTheme(name: "Animal", emojis: "🐶🦊🐯🦄🐝🐠", icon: "🐶"),
        EmojiTheme(name: "Fruit",  emojis: "🍏🍊🥦🍋🌽🍇", icon: "🍇")
    ]

    private static func createMemoryGame () -> MemoryGame<String> {
        return MemoryGame<String>(numberOfCards: 10) { pairIndex in
            if (emojis.indices.contains(pairIndex)){
                return emojis[pairIndex]
            } else {
                return "🈳"
            }
        }
    }

    @Published private var gameModel = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card>{
        return gameModel.cards
    }
    

    // MARK: - Intents
    
    func shuffle(){
        gameModel.shuffle()
    }
    
    func choose (_ card: MemoryGame<String>.Card){
        
        gameModel.chooseCard(card)
    }
    
}
