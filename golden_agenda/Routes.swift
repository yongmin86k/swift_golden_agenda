//
//  Routes.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-06-23.
//

import Foundation
import SwiftUI

enum Routes: String, CaseIterable {
    case addAgenda = "Add agenda"
    case agenda = "Agenda"
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
        case .addAgenda:
            return GAShapes.plusThick
        case .agenda:
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

extension Routes: View {
    var body: some View {
        switch self {
        case .addAgenda:
            AddAgendaView()
        case .agenda:
            AgendaView()
        case .reports:
            ReportView()
        case .rewards:
            RewardView()
        case .settings:
            SettingView()
        }
    }
}
