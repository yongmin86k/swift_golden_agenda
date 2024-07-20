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
                NavigationStack {
                    ZStack {
                        ForEach(gaBottomTabs, id: \.self) { route in
                            let show = gaRouter.isActive(route)

                            route.body
                                .opacity(show ? 1 : 0)
                                .animation(.easeInOut(duration: gaAppState.animationDefaultDuration), value: show)
                        }
                    }
                    .GABackground()
                    .toolbar {
                        switch gaRouter.selectedTab {
                            case .agenda:
                                AgendaToolbar()
                            default:
                                OtherToolbar()
                        }
                    }
                }

                GABottomBarView(proxy)
            }
            .ignoresSafeArea()
            .preference(key: ContentSizePreferenceKey.self, value: proxy.size)
            .onPreferenceChange(ContentSizePreferenceKey.self) { value in
                gaDeviceState.screenSize = value
            }
        }
    }

    @ToolbarContentBuilder
    func OtherToolbar() -> some ToolbarContent {
        ToolbarItem(
            placement: .principal,
            content: {
                HStack {
                    Text("\(gaRouter.selectedTab.rawValue.description)")
                        .gaTypography(.title2)
                }
                .foregroundStyle(.black1)
            }
        )
    }
}

private struct ContentSizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

#Preview {
    GAContentView().globalPreviewInjection()
}
