//
//  SplashQuoteView.swift
//  FeelGood
//
//  Created by julie ryan on 18/07/2024.
//

import SwiftUI

struct SplashQuoteView: View {
    var body: some View {
        VStack {
            Text("Feel good Quote").font(.largeTitle)
            Text(" ").font(.largeTitle)
            
            Image(systemName: "tree.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            
            Image(systemName: "signature")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
        }
    }
}

#Preview {
    SplashQuoteView()
}
