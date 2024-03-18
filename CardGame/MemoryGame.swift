//
//  MemorizeGame.swift
//  CardGame
//
//  Created by Kyle on 2024/3/12.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    private(set) var cards: Array<Card>
    
    init(numberOfCards: Int, cardContentFactory: (Int) -> CardContent){
        cards = []
        
        // add cards
        for pairIndex in 0..<max(2,numberOfCards){
            cards.append(Card(content: cardContentFactory(pairIndex), id: "\(pairIndex)a"))
            cards.append(Card(content: cardContentFactory(pairIndex), id: "\(pairIndex)b"))
        }
    }
    
    func chooseCard(_ card: Card){
        print(card)
    }
    
    mutating func shuffle(){
        cards.shuffle()
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible{
        var isFaceUp = true
        var isMatched = false
        var content: CardContent
        
        var id: String
        var debugDescription: String {
            "\(id)-\(content)-\(isMatched)-\(isFaceUp)"
        }
    }
}
