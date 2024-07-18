//
//  GetQuote.swift
//  FeelGood
//
//  Created by julie ryan on 17/07/2024.
//

import Foundation
import Combine
import SwiftUI

class GetQuote: ObservableObject {
    @Published var content: String?
    @Published var author: String?
    @Published var imageLoader = ImageLoader()
    
    let url = URL(string: "https://api.quotable.io/random")!
    
    func fetchQuote() {
            imageLoader.loadImage { [weak self] image in
                guard let self = self else { return }
                
                self.fetchQuoteData { content, author in
                    DispatchQueue.main.async {
                        self.content = content
                        self.author = author
                    }
                }
            }
        }
        
        private func fetchQuoteData(completion: @escaping (String, String) -> Void) {
            let session = URLSession.shared
            let task = session.dataTask(with: url) {(data, response, error) in
                guard let data = data, error == nil else {
                    print("Erreur réseau: \(error?.localizedDescription ?? "Erreur inconnue")")
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let quoteResponse = try decoder.decode(Quote.self, from: data)
                    completion(quoteResponse.content, quoteResponse.author)
                } catch {
                    print("Erreur de déserialization JSON: \(error.localizedDescription)")
                }
            }
            
            task.resume()
        }
    
    
    private func updateQuote(content: String, author: String) {
        DispatchQueue.main.async {
            self.content = content
            self.author = author
        }
        
    }
    
}

