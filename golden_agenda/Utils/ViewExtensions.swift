//
//  ViewExtensions.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-06-27.
//  Ref: https://stackoverflow.com/questions/77366385/how-to-bind-environment-globally-to-all-swiftui-previews

import CoreData
import SwiftUI

extension View {
    func globalPreviewInjection() -> some View {
        modifier(GlobalPreviewInjectionModifier())
    }
}

struct GlobalPreviewInjectionModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .environmentObject(GAAppState())
            .environmentObject(GADeviceState())
    }
}
