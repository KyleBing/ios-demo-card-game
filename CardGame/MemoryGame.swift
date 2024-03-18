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
    
    // 最后一张向上卡片的 index
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            cards.indices
                .filter{ !cards[$0].isMatched }  // 过滤掉已经匹配的
                .filter{ cards[$0].isFaceUp }.only
        }
        set {
            cards.indices
                .filter({ !cards[$0].isMatched }) // 过滤掉已经匹配的
                .forEach{  cards[$0].isFaceUp = (newValue == $0) }
        }
    }

    
    mutating func chooseCard(_ card: Card){
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            // 卡片未朝上的 && 卡片未被匹配的才会动作它
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched{
                if let lastIndexFaceUp = indexOfTheOneAndOnlyFaceUpCard{
                    if cards[lastIndexFaceUp].content == cards[chosenIndex].content {
                        // 如果匹配
                        cards[lastIndexFaceUp].isMatched = true
                        cards[chosenIndex].isMatched = true
                    }
                } else {
                    indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
            }
        }
    }
    
    mutating func shuffle(){
        cards.shuffle()
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible{
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
        
        var id: String
        var debugDescription: String {
            "\(id)-\(content)-\(isMatched)-\(isFaceUp)"
        }
    }
}

// MARK: - 扩展 Array

extension Array{
    var only: Element? {
        count == 1 ? first : nil
    }
}
