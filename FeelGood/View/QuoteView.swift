//
//  QuoteView.swift
//  FeelGood
//
//  Created by julie ryan on 17/07/2024.
//

import SwiftUI

struct QuoteView: View {
    @State private var justLaunched: Bool = true
    @StateObject private var quote = GetQuote()
    private var timer = Timer.publish(every: 2.0, on: .main, in: .common).autoconnect()

    var body: some View {
        if justLaunched {
            SplashQuoteView()
                .onReceive(timer) { _ in
                    justLaunched = false
                }
        } else {
            QuoteViewModel(justLaunched: $justLaunched, quote: quote)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                        justLaunched = false
                    }
                }
        }
    }
}


#Preview {
    QuoteView()
}
