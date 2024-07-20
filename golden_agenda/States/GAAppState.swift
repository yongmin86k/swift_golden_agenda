//
//  gaAppState.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-06-24.
//

import SwiftUI

final class GAAppState: ObservableObject {
    @Published var selectedDate: Date
    
    init() {
        self.selectedDate = Date()
    }
    
    private var _animationDefaultDuration: TimeInterval = 0.3
    private var _animationExtraBounceRate: Double = 0.5
    
    /// - Returns: 0.3
    var animationDefaultDuration: TimeInterval {
        return _animationDefaultDuration
    }
    
    /// - Returns: 0.5
    var animationExtraBounceRate: Double {
        return _animationExtraBounceRate
    }

    var dateInWheel: [Date] {
        let arr = [Int](-14 ... 15)
                
        return arr.map { selectedDate.addingDays($0) }
    }
    
    var degreesInWheel: [Angle] {
        return dateInWheel.map { getDateItemDegree(date: $0) }
    }
    
    var totalDays: Int {
        return dateInWheel.count
    }
    
    var selectedDateIndex: Int {
        return dateInWheel.firstIndex(of: selectedDate)!
    }
    
    func getDateItemIndex(date: Date) -> Int {
        return dateInWheel.firstIndex(of: date)!
    }
    
    func getDateItemDegree(date: Date) -> Angle {
        let index = dateInWheel.firstIndex(of: date)!
        let offset = index - selectedDateIndex
        
        return Angle(degrees: Double(360 / totalDays * offset))
    }
}
