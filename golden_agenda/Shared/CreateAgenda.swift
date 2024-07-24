//
//  CreateAgenda.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-07-23.
//

import SwiftUI

class CreateAgenda: ObservableObject {
    private var gaAppStorage: GAAppStorage
    
    @Published var title: String
    @Published var category: String
    @Published private var _pointEarned: Int
    @Published private var _pointLost: Int
    @Published var detail: String?
    @Published var location: String?
    
    init() {
        self.gaAppStorage = GAAppStorage()
        
        self.title = ""
        self.category = gaAppStorage.defaultCategory
        self._pointEarned = gaAppStorage.defaultRewardPoint
        self._pointLost = gaAppStorage.defaultPenaltyPoint
    }
    
    var pointEarned: Int? {
        set { _pointEarned = Int(newValue ?? gaAppStorage.defaultRewardPoint) }
        get { return _pointEarned }
    }
    
    var pointLost: Int? {
        set { _pointLost = Int(newValue ?? 0) }
        get { return _pointLost }
    }
    
    func populate() {
        // TODO: load from core data
    }
    
    func reset() {
        title = ""
        category = gaAppStorage.defaultCategory
        _pointEarned = gaAppStorage.defaultRewardPoint
        _pointLost = gaAppStorage.defaultPenaltyPoint
    }
    
    func save() {
        // TODO: save at core data
    }
}
