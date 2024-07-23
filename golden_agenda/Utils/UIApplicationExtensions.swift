//
//  UIApplicationExtensions.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-07-20.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
