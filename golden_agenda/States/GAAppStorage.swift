//
//  GAAppStorage.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-07-12.
//

import Foundation
import SwiftUI

class GAAppStorage: ObservableObject {
    static var instance = GAAppStorage()
    
    // MARK: Default device settings
    @Published @AppStorage("isAppFirstInstalled") var isAppFirstInstalled = false
    
    // MARK: Default user settings
    @Published @AppStorage("defaultAgendaViewType") var defaultAgendaViewType = "overview"
    @Published @AppStorage("defaultCategory") var defaultCategory = "uncategorized"
    @Published @AppStorage("defaultPenaltyPoint") var defaultPenaltyPoint: Int = 0
    @Published @AppStorage("defaultRepeatDate") var defaultRepeatDate = "any"
    @Published @AppStorage("defaultRewardPoint") var defaultRewardPoint: Int = 0
    
    // MARK: Default user information
    @Published @AppStorage("penaltyEarned") var penaltyEarned: Int = 0
    @Published @AppStorage("rewardEarned") var rewardEarned: Int = 0
    @Published @AppStorage("rewardUsed") var rewardUsed: Int = 0
    
    var currentPoint: Int {
        return rewardEarned - rewardUsed
    }
}
