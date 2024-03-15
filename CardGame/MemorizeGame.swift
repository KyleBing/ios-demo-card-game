//
//  CardGameApp.swift
//  CardGame
//
//  Created by Kyle on 2024/3/8.
//

import SwiftUI

@main
struct MemorizeGame: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
