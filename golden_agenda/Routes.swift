//
//  Routes.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-06-23.
//

import Foundation
import SwiftUI

enum Routes: String, CaseIterable {
    case addReminders = "Add reminders"
    case reminders = "Agenda"
    case reports = "Reports"
    case rewards = "Rewards"
    case settings = "Settings"
}

extension Routes {
    var name: String {
        return self.rawValue.description
    }
    
    var shape: GAShapes {
        switch self {
        case .addReminders:
            return GAShapes.plusThick
        case .reminders:
            return GAShapes.formatListChecks
        case .reports:
            return GAShapes.chartTimelineVariantShimmer
        case .rewards:
            return GAShapes.giftOutline
        case .settings:
            return GAShapes.cogOutline
        }
    }
}

