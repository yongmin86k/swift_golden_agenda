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
            .environmentObject(GARouter())
    }
}

extension View {
  func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
    background(
      GeometryReader { geometryProxy in
        Color.clear
          .preference(key: SizePreferenceKey.self, value: geometryProxy.size)
      }
    )
    .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
  }
}

private struct SizePreferenceKey: PreferenceKey {
  static var defaultValue: CGSize = .zero
  static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}
