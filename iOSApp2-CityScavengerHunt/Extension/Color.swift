//
//  Color.swift
//  iOSApp2-CityScavengerHunt
//
//  Created by Royal K on 2025-02-18.
//

import SwiftUI

extension Color {
    static func random() -> Color {
        Color(
            red: Double.random(in: 0.2...0.9),
            green: Double.random(in: 0.2...0.9),
            blue: Double.random(in: 0.2...0.9)
        )
    }
}
