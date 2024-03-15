//
//  MemorizeGame.swift
//  CardGame
//
//  Created by Kyle on 2024/3/12.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    init(numberOfCards: Int, cardContentFactory: (Int) -> CardContent){
        cards = []
        
        // add cards
        for pairIndex in 0..<max(2,numberOfCards){
            cards.append(Card(content: cardContentFactory(pairIndex)))
            cards.append(Card(content: cardContentFactory(pairIndex)))
        }
    }
    
    func chooseCard(_ card: Card){
        
    }
    
    mutating func shuffle(){
        cards.shuffle()
    }
    
    struct Card{
        var isFaceUp = true
        var isMatched = false
        var content: CardContent
    }
}
