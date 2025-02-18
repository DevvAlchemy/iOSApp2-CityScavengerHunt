//
//  CardView.swift
//  iOSApp2-CityScavengerHunt
//
//  Created by Royal K on 2025-02-18.
//

import SwiftUI

struct CardView: View {
    let card: Card

    var body: some View {
        VStack(spacing: 15) {
            Text(card.scavengerHuntItem.businessName)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)

            Text(card.scavengerHuntItem.clue)
                .font(.body)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            if let image = card.scavengerHuntItem.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }

            if card.scavengerHuntItem.isCompleted {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
                    .font(.title)
            }
        }
        .frame(maxWidth: .infinity, minHeight: 200)
        .background(card.backgroundColor)
        .cornerRadius(15)
        .shadow(radius: 5)
        .padding(.horizontal)
    }
}

