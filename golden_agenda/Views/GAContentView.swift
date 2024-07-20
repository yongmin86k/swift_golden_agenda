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
            .task(id: proxy.size.height, {
                DispatchQueue.main.async {
                    gaDeviceState.screenSize = proxy.size
                    
                    print("ContentView: \(proxy.size)")
                }
            })
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

#Preview {
    GAContentView().globalPreviewInjection()
}
