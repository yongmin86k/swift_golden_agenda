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
    @Published var keyboardHeight: CGFloat
    
    init() {
        self.screenSize = .zero
        self.deviceOrientation = .portrait
        self.keyboardHeight = .zero
        
        NotificationCenter.default.addObserver(self, selector: #selector(orientationChanged), name: UIDevice.orientationDidChangeNotification, object: nil)
        UIDevice.current.beginGeneratingDeviceOrientationNotifications()
        
        listenForKeyboardNotifications()
    }
    
    @objc private func orientationChanged() {
        deviceOrientation = UIDevice.current.orientation
    }
    
    private func listenForKeyboardNotifications() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification,
                                               object: nil,
                                               queue: .main)
        { notification in
            guard let userInfo = notification.userInfo,
                  let keyboardRect = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
                                                
            self.keyboardHeight = keyboardRect.height
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification,
                                               object: nil,
                                               queue: .main)
        { _ in
            self.keyboardHeight = 0
        }
    }
}
