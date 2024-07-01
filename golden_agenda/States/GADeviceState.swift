//
//  GADeviceState.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-06-27.
//

import SwiftUI

final class GADeviceState: ObservableObject {
    @Published var screenSize: CGSize
    @Published var deviceOrientation: UIDeviceOrientation
    // Ref: https://www.hackingwithswift.com/example-code/uikit/how-to-check-whether-an-iphone-or-ipad-is-upside-down-or-face-up
    
    init() {
        self.screenSize = .zero
        self.deviceOrientation = .portrait
        
        NotificationCenter.default.addObserver(self, selector: #selector(orientationChanged), name: UIDevice.orientationDidChangeNotification, object: nil)
        UIDevice.current.beginGeneratingDeviceOrientationNotifications()
    }
    
    @objc private func orientationChanged() {
        self.deviceOrientation = UIDevice.current.orientation
    }
}
