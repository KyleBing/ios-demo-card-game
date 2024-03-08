//
//  CardView.swift
//  CardGame
//
//  Created by Kyle on 2024/3/8.
//

import SwiftUI

struct CardView: View {
    
    @State var isFaceUp = false
    
    var body: some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(style: StrokeStyle(lineWidth: 2))
                Text("🌏").font(.largeTitle)
                
            } else {
                base.foregroundColor(.orange)
            }
        }
        .onTapGesture(perform: {
            isFaceUp.toggle()
        })
    }
}



#Preview {
    CardView()
}
