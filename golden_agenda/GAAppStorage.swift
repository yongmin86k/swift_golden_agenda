//
//  GAAppStorage.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-07-12.
//  Ref: https://fatbobman.medium.com/mastering-appstorage-in-swiftui-682be3258cf2

import Foundation
import SwiftUI

class GAAppStorage: ObservableObject {
    // MARK: Default device settings
    @AppStorage("isAppFirstInstalled") var isAppFirstInstalled = false
    
    // MARK: Default user settings
    @AppStorage("defaultAgendaViewType") var defaultAgendaViewType = "overview"
    @AppStorage("defaultCategory") var defaultCategory = "uncategorized"
//    @AppStorage("defaultRepeatDate") var defaultRepeatDate = "any"
    @AppStorage("defaultPenaltyPoint") var defaultPenaltyPoint: Int = 0
    @AppStorage("defaultRewardPoint") var defaultRewardPoint: Int = 0
    
    // MARK: Default user information
    @AppStorage("penaltyEarned") var penaltyEarned: Int = 0
    @AppStorage("rewardEarned") var rewardEarned: Int = 0
    @AppStorage("rewardUsed") var rewardUsed: Int = 0
    
    var currentPoint: Int {
        return rewardEarned - rewardUsed
    }
}
