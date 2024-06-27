//
//  GAAppStore.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-06-24.
//

import SwiftUI

final class GAAppStore: ObservableObject {
    @Published var screenSize: CGSize = .zero
    
    @Published var selectedDate: Date = Date()

    var dateInWheel: [Date] {
        get {
            let arr = [Int](-14...15)
            
            return arr.map{selectedDate.addingDays($0)}
        }
    }
}
