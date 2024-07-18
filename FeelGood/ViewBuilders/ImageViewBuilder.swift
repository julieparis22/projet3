//
//  ImageViewBuilder.swift
//  FeelGood
//
//  Created by julie ryan on 18/07/2024.
//

import Foundation
import SwiftUI


@ViewBuilder
func ConditionalImageView(image: UIImage?) -> some View {
    if let image = image {
        Image(uiImage: image)
            .resizable()
            .scaledToFit()
            .frame(width: 300, height: 300)
    } else {
        Text(" ")
            .frame(width: 300, height: 300)
    }
}
