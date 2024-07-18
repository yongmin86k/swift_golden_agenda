//
//  GABottomBarView.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-06-23.
//  Ref: https://mobileappsacademy.medium.com/custom-bottom-tab-bar-swiftui-17749b6a0a5b

import SwiftUI

private var tabs = [
    Routes.agenda,
    Routes.rewards,
    Routes.addAgenda,
    Routes.reports,
    Routes.settings,
]

struct GABottomBarView: View {
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
                TabView(selection: $gaRouter.routes.last) {
                    ForEach(tabs, id: \.self) { route in
                        route.body.tag(route)
                    }
                }
                
                if gaRouter.selectedTab != .addAgenda {
                    GATabBar(parentSize: proxy)
                }
            }
            .ignoresSafeArea()
            .preference(key: SizePreferenceKey.self, value: proxy.size)
            .onPreferenceChange(SizePreferenceKey.self) { value in
                gaDeviceState.screenSize = value
            }
        }
    }
    
    @ViewBuilder
    func GATabBar(parentSize: GeometryProxy) -> some View {
        let horizontalPadding: CGFloat = 4
        let verticalPadding: CGFloat = 12
        let containerWidth: CGFloat = parentSize.size.width - horizontalPadding * 2
        let addReminderButtonSize: CGFloat = 68
        let otherButtonSize: CGFloat = (containerWidth - addReminderButtonSize) / CGFloat(tabs.count)
        let containerHeight: CGFloat = parentSize.safeAreaInsets.bottom + otherButtonSize + verticalPadding
        
        HStack(
            alignment: .top,
            content: {
                Spacer()
                ForEach(tabs, id: \.self) { route in
                    let isAddReminderRoute = route == Routes.addAgenda
                    
                    if isAddReminderRoute {
                        FloatActionButton(route: route, buttonSize: addReminderButtonSize)
                    } else {
                        GATabItem(route: route, buttonSize: otherButtonSize)
                    }
                }
                Spacer()
            }
        )
        .frame(width: containerWidth, height: containerHeight, alignment: .top)
        .background {
            WhiteBackdropBlurView()
        }
    }
    
    @ViewBuilder
    func GATabItem(route: Routes, buttonSize: CGFloat) -> some View {
        let isActive = gaRouter.isActive(route)
        
        let animationDuration = gaAppState.animationDefaultDuration
        let extraBounceRate = gaAppState.animationExtraBounceRate
        
        HStack(
            alignment: .center,
            content: {
                ZStack(
                    alignment: Alignment(
                        horizontal: .center,
                        vertical: .top
                    ),
                    content: {
                        Rectangle()
                            .cornerRadius(2.0)
                            .frame(width: isActive ? buttonSize - 32 : 0, height: 4)
                            .foregroundColor(.yellow1)
                            .offset(y: 0)
                            .animation(
                                isActive
                                    ? .bouncy(duration: animationDuration, extraBounce: extraBounceRate)
                                    : .linear(duration: animationDuration / 2),
                                value: isActive
                            )
                        
                        ZStack {
                            Text(route.name)
                                .multilineTextAlignment(.center)
                                .foregroundColor(isActive ? .yellow1 : .grey2)
                                .gaTypography(.footnote1)
                                .rotation3DEffect(.degrees(isActive ? 0 : 180), axis: (x: 0, y: 1, z: 0))
                                .animation(.linear(duration: animationDuration), value: isActive)
                                .opacity(isActive ? 1 : 0)
                            
                            createGAShape(type: route.shape)
                                .foregroundColor(isActive ? .yellow1 : .grey2)
                                .frame(width: 24, height: 24)
                                .opacity(isActive ? 0 : 1)
                                .animation(.linear(duration: animationDuration / 2), value: isActive)
                        }
                        .frame(width: buttonSize, height: buttonSize)
                        .contentShape(Rectangle())
                        .onTapGesture {
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//                                withAnimation {
//                                    gaRouter.pushTo(route)
//                                }
//                            }
                            
                            withAnimation {
                                gaRouter.pushTo(route)
                            }
                        }
                    }
                )
            }
        )
    }
    
    @ViewBuilder
    func FloatActionButton(route: Routes, buttonSize: CGFloat) -> some View {
        let tabGesture = TapGesture().onEnded {
            gaRouter.pushTo(route)
        }
        
        ZStack(
            alignment: Alignment(horizontal: .center, vertical: .center),
            content: {
                Rectangle()
                    .fill(
                        AngularGradient(gradient: Gradient(colors: [.yellow1, .yellow2, .yellow1]), center: .center, startAngle: .degrees(45), endAngle: .degrees(405))
                    )
                    .frame(width: buttonSize, height: buttonSize)
                    .cornerRadius(26.0)
                    .shadow(color: .black.opacity(0.32), radius: 12, y: 2)
                
                Image(systemName: "plus")
                    .gaTypography(.title1)
                    .foregroundColor(.white)
            }
        ).offset(y: -10)
            .frame(width: buttonSize, height: buttonSize)
            .gesture(tabGesture)
    }
}

private struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

#Preview {
    GABottomBarView().globalPreviewInjection()
}
