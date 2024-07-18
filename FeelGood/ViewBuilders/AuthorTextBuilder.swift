//
//  AuthorTextBuilder.swift
//  FeelGood
//
//  Created by julie ryan on 18/07/2024.
//

import Foundation
import SwiftUI
@ViewBuilder
func ConditionalAuthorView(text: String?) -> some View {
    
    if let text = text {
        ZStack {
            
            Text("\(text)")
                .font(.body)
                .italic()
                .foregroundColor(Color.white)
                .offset(x: 1, y: 1)
                .shadow(color: Color.black, radius: 5)
            
            
            Text("\(text)")
                .font(.body)
                .italic()
                .foregroundColor(Color.black)
                .offset(x: 1, y: 1)
                .shadow(color: Color.black, radius: 5)
            
            Text("\(text)")
                .font(.body)
                .italic()
                .foregroundColor(Color.white)
                .offset(x: -1, y: -1)
                .shadow(color: Color.black, radius: 5)
            
     
           

        }
        .frame(width: 250)
    } else {
        Text("Loading")
    }
    
}
