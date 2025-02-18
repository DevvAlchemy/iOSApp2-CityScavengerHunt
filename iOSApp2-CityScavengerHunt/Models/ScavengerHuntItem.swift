//
//  ScavengerHuntItem.swift
//  iOSApp2-CityScavengerHunt
//
//  Created by Royal K on 2025-02-18.
//

import SwiftUI

struct ScavengerHuntItem: Identifiable {
    let id = UUID()
    let clue: String
    let businessName: String
    var isCompleted: Bool = false
    var image: UIImage?
}
