//
//  ViewExtensions.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-06-27.
//  Ref: https://www.fivestars.blog/articles/flexible-swiftui/
//  Ref: https://betterprogramming.pub/geometryreader-blessing-or-curse-1ebd2d5005ec

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
    .onPreferenceChange(SizePreferenceKey.self, perform: { size in
        DispatchQueue.main.async {
            onChange(size)
        }
    })
  }
}

private struct SizePreferenceKey: PreferenceKey {
  static var defaultValue: CGSize = .zero
  static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}

extension View {
    func `if`<Content: View>(_ conditional: Bool, content: (Self) -> Content) -> TupleView<(Self?, Content?)> {
        if conditional {
            return TupleView((nil, content(self)))
        } else {
            return TupleView((self, nil))
        }
    }
}
