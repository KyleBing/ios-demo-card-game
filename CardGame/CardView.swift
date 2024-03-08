//
//  CardView.swift
//  CardGame
//
//  Created by Kyle on 2024/3/8.
//

import SwiftUI

struct CardView: View {
    
    var isFaceUp: Bool = false
    
    var body: some View {
        ZStack{
            if isFaceUp {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 20)
                    .strokeBorder(style: StrokeStyle(lineWidth: 2))
                Text("🌏")
                    .font(.largeTitle)
                
            } else {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.orange)
            }
           
        }
        .foregroundColor(.gray)
        .padding(10)

    }
}



#Preview {
    CardView()
}
