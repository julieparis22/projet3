//
//  QuoteTextViewBuilder.swift
//  FeelGood
//
//  Created by julie ryan on 18/07/2024.
//

import Foundation
import SwiftUI

// Fonction pour afficher du texte conditionnellement
@ViewBuilder
func ConditionalContentView(text: String?) -> some View {
    if let text = text {
        ZStack {
            
            Text("\(text)")
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .offset(x: 1, y: 1)
                .shadow(color: Color.black, radius: 5)
            
            
            Text("\(text)")
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
                .offset(x: 1, y: 1)
                .shadow(color: Color.black, radius: 5)
            
            Text("\(text)")
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .offset(x: -1, y: -1)
                .shadow(color: Color.black, radius: 5)
            
     
           

        }
        .frame(width: 250)
    } else {
        Text(" ")
            .frame(width: 250)
    }
}
