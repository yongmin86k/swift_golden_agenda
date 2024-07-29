//
//  CreateAgenda.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-07-23.
//

import SwiftUI

enum CreateAgendaProperties: CaseIterable {
    case title
    case category
    case pointEarned
    case pointLost
    case detail
    case location
}

class CreateAgenda: ObservableObject {
    private var gaAppStorage: GAAppStorage
    
    @Published var title: String
    @Published var category: String
    @Published private var _pointEarned: Int
    @Published private var _pointLost: Int
    @Published var detail: String?
    @Published var location: String?
    @Published var errorMessages = [CreateAgendaProperties: String]()
    
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
    
    func validate() -> Bool {
        for property in CreateAgendaProperties.allCases {
            switch property {
            case .title:
                if title.isEmpty {
                    errorMessages[.title] = "Please type a title"
                } else {
                    errorMessages.removeValue(forKey: .title)
                }
                
            default:
                break
            }
        }
        
        return errorMessages.isEmpty
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
        let isValidated = validate()
        
        guard isValidated else {
            return
        }
        
        // TODO: save at core data
        print("title: \(title)", "category: \(category)", pointEarned as Any, pointLost as Any)
    }
}
