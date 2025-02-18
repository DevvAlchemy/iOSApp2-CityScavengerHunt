//
//  Card.swift
//  iOSApp2-CityScavengerHunt
//
//  Created by Royal K on 2025-02-18.
//

import SwiftUI

struct Card: Identifiable {
    let id = UUID()
    let backgroundColor: Color
    var scavengerHuntItem: ScavengerHuntItem
}

