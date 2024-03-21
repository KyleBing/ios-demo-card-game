//
//  AspectVGrid.swift
//  CardGame
//
//  Created by Kyle on 2024/3/21.
//

import SwiftUI

struct AspectVGrid<Item: Identifiable, ItemView: View>: View {
    private var items: [Item]
    private var cardAspectRatio: CGFloat = 1.0
    private var content: (Item) -> ItemView
    
    init(_ items: [Item], cardAspectRatio: CGFloat, @ViewBuilder content: @escaping (Item) -> ItemView) {
        self.items = items
        self.cardAspectRatio = cardAspectRatio
        self.content = content
    }

    
    var body: some View {
        GeometryReader{ geometry in
            let gridItemSize = gridItemWidthThatFits(
                count: items.count,
                size: geometry.size,
                atAspectRatio: cardAspectRatio
            )
            LazyVGrid(
                columns: [GridItem(.adaptive(minimum: gridItemSize), spacing: 0)],
                spacing: 0
            ) {
                ForEach(items){ item in
                    content(item)
                        .aspectRatio(cardAspectRatio, contentMode: .fit)
                    
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
