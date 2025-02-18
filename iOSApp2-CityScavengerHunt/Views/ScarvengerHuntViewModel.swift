//
//  ScarvengerHuntViewModel.swift
//  iOSApp2-CityScavengerHunt
//
//  Created by Royal K on 2025-02-18.
//

import SwiftUI

class ScavengerHuntViewModel: ObservableObject {
    @Published var cards: [Card]
    @Published var completedItems: Int = 0

    init() {
        self.cards = [
            Card(backgroundColor: .random(), scavengerHuntItem: ScavengerHuntItem(clue: "Find the golden statue near the entrance.", businessName: "Main Street Cafe")),
            Card(backgroundColor: .random(), scavengerHuntItem: ScavengerHuntItem(clue: "Look for the red umbrella on the patio.", businessName: "Riverside Diner")),
            Card(backgroundColor: .random(), scavengerHuntItem: ScavengerHuntItem(clue: "Find the vintage typewriter in the corner.", businessName: "Book Nook")),
            Card(backgroundColor: .random(), scavengerHuntItem: ScavengerHuntItem(clue: "Locate the chalkboard with today's specials.", businessName: "The Daily Grind")),
            Card(backgroundColor: .random(), scavengerHuntItem: ScavengerHuntItem(clue: "Find the painting of a mountain landscape.", businessName: "Artisan Gallery")),
            Card(backgroundColor: .random(), scavengerHuntItem: ScavengerHuntItem(clue: "Look for the neon 'Open' sign in the window.", businessName: "City Lights Bakery")),
            Card(backgroundColor: .random(), scavengerHuntItem: ScavengerHuntItem(clue: "Find the giant coffee cup sculpture.", businessName: "Brew & Bean")),
            Card(backgroundColor: .random(), scavengerHuntItem: ScavengerHuntItem(clue: "Locate the bookshelf with the red ladder.", businessName: "Page Turner Bookstore")),
            Card(backgroundColor: .random(), scavengerHuntItem: ScavengerHuntItem(clue: "Find the clock with Roman numerals.", businessName: "Timepiece Antiques")),
            Card(backgroundColor: .random(), scavengerHuntItem: ScavengerHuntItem(clue: "Look for the blue awning with white stripes.", businessName: "Seaside Bistro"))
        ]
    }

    func completeItem(at index: Int) {
        cards[index].scavengerHuntItem.isCompleted = true
            completedItems += 1
    }
}
