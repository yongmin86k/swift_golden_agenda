//
//  GAContentView.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-07-18.
//

import SwiftUI

struct GAContentView: View {
    @EnvironmentObject private var gaAppState: GAAppState
    @EnvironmentObject private var gaDeviceState: GADeviceState
    @EnvironmentObject private var gaRouter: GARouter

    var body: some View {
        GeometryReader { proxy in
            ZStack(
                alignment:
                Alignment(
                    horizontal: .center,
                    vertical: .bottom
                )
            ) {
                Color.grey1
                
                gaRouter.selectedTab.body
                    .transition(.move(edge: .bottom))

                GABottomBarView(proxy)
            }
            .ignoresSafeArea()
            .preference(key: SizePreferenceKey.self, value: proxy.size)
            .onPreferenceChange(SizePreferenceKey.self) { value in
                gaDeviceState.screenSize = value
            }
        }
    }
}

private struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

#Preview {
    GAContentView().globalPreviewInjection()
}
