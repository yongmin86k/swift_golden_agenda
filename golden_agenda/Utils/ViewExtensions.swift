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

enum OffsetWithAnimationType {
    case foreground
    case background
}

private struct OffsetWithAnimationModifier: ViewModifier {
    var animationType: OffsetWithAnimationType
    var show: Bool
    var height1: CGFloat
    var height2: CGFloat

    func body(content: Content) -> some View {
        switch animationType {
        case .foreground:
            content
                .offset(y: show ? height1 : height2)
                .animation(.bouncy(duration: 0.4, extraBounce: 0.1), value: show)
        case .background:
            content
                .offset(y: show ? height1 : height2)
                .animation(.easeInOut(duration: 0.7), value: show)
        }
    }
}

extension View {
    func offsetWithAnimation(
        _ animationType: OffsetWithAnimationType,
        _ show: Bool,
        _ height1: CGFloat,
        _ height2: CGFloat
    ) -> some View {
        modifier(OffsetWithAnimationModifier(animationType: animationType, show: show, height1: height1, height2: height2))
    }
}
