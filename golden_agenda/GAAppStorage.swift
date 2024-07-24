//
//  GAAppStorage.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-07-12.
//  Ref: https://fatbobman.medium.com/mastering-appstorage-in-swiftui-682be3258cf2

import Foundation
import SwiftUI

class GAAppStorage: ObservableObject {
    // MARK: Default user settings

    @AppStorage("defaultAgendaViewType") var defaultAgendaViewType = "overview"
    @AppStorage("defaultCategory") var defaultCategory = "Uncategorized"
    @AppStorage("defaultRewardPoint") var defaultRewardPoint: Int = 1
    @AppStorage("defaultPenaltyPoint") var defaultPenaltyPoint: Int = 0

    // MARK: Default user information

    @AppStorage("pointEarned") var pointEarned: Int = 0
    @AppStorage("pointLost") var pointLost: Int = 0
    @AppStorage("pointUsed") var pointUsed: Int = 0

    var currentPoint: Int {
        return pointEarned - pointLost - pointUsed
    }
}
