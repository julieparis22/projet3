//
//  QuoteViewModel.swift
//  FeelGood
//
//  Created by julie ryan on 17/07/2024.
//

import SwiftUI

struct QuoteViewModel: View {
    
    @Binding var justLaunched: Bool
    @StateObject var quote = GetQuote()
    var timer = Timer.publish(every: 2.0, on: .main, in: .common).autoconnect()

    var body: some View {
        
        
        Spacer()
        ZStack {
   
                
            ConditionalImageView(image: quote.imageLoader.image)
      
            
            VStack {
                ConditionalContentView(text: quote.content)
                
                Spacer()
                ConditionalAuthorView(text: quote.author)
      
                
            }
            .frame(height: 250)
        }
        Spacer()
   
    
            Button("New Quote") {
                quote.fetchQuote()
            }.font(.largeTitle).foregroundStyle(Color("TextButton")) .background(Color("ButtonBackground"))
     
        
        Spacer()
        .onChange(of: justLaunched) { oldValue, newValue in
            if !newValue {
                quote.fetchQuote()
            }
        }
        .onAppear {
            if !justLaunched {
                quote.fetchQuote()
            }
        }
    }
}

#Preview {
    QuoteViewModel(justLaunched: .constant(true))
}
