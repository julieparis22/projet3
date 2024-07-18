//
//  ImageLoader.swift
//  FeelGood
//
//  Created by julie ryan on 17/07/2024.
//




import Foundation
import UIKit

class ImageLoader: ObservableObject {
    @Published var image: UIImage? = nil // Initialisé à nil
    
    private var dataTask: URLSessionDataTask?
    
    func loadImage(completion: @escaping (UIImage?) -> Void) {
        let url = URL(string: "https://picsum.photos/300")!
   
        
        dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let data = data, error == nil else {
       
                completion(nil)
                return
            }
            
            DispatchQueue.main.async {
                self?.image = UIImage(data: data)
                completion(self?.image)
            }
        }
        
        dataTask?.resume()
    }
}



