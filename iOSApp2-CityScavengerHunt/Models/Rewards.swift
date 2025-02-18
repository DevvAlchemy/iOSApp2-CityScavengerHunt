//
//  Rewards.swift
//  iOSApp2-CityScavengerHunt
//
//  Created by Royal K on 2025-02-18.
//

import SwiftUI

struct Rewards {
    static func calculateReward(foundItems: Int) -> String {
        switch foundItems {
        case 10:
            return "Congratulations! You've found all items! You get a 20% discount AND entry into the $5000 grand prize draw! 🎉"
        case 7...9:
            return "Great job! You've earned a 20% discount! 🎉"
        case 5...6:
            return "Well done! You've earned a 10% discount! 🎂"
        default:
            return "Keep hunting! Find more items to earn rewards! 🎯"
        }
    }

    static func getDiscountPercentage(foundItems: Int) -> Int {
        switch foundItems {
        case 7...10: return 20
        case 5...6: return 10
        default: return 0
        }
    }
}
