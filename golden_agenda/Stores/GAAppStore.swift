//
//  GAAppStore.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-06-24.
//

import SwiftUI

final class GAAppStore: ObservableObject {
    @Published var screenSize: CGSize
    @Published var selectedDate: Date
    @Published var deviceOrientation: UIDeviceOrientation
    // Ref: https://www.hackingwithswift.com/example-code/uikit/how-to-check-whether-an-iphone-or-ipad-is-upside-down-or-face-up
    
    init() {
        self.screenSize = .zero
        self.selectedDate = Date()
        self.deviceOrientation = .portrait
        
        NotificationCenter.default.addObserver(self, selector: #selector(orientationChanged), name: UIDevice.orientationDidChangeNotification, object: nil)
        UIDevice.current.beginGeneratingDeviceOrientationNotifications()
    }

    var dateInWheel: [Date] {
        get {
            let arr = [Int](-14...15)
            
            return arr.map{selectedDate.addingDays($0)}
        }
    }
    
    @objc private func orientationChanged() {
        self.deviceOrientation = UIDevice.current.orientation
    }
}
