//
//  GABottomBarView.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-06-23.
//  Ref: https://www.swiftyplace.com/blog/tabview-in-swiftui-styling-navigation-and-more
//  Ref: https://mobileappsacademy.medium.com/custom-bottom-tab-bar-swiftui-17749b6a0a5b

import SwiftUI

struct GABottomBarView: View {
    @EnvironmentObject private var gaAppState: GAAppState
    @EnvironmentObject private var gaDeviceState: GADeviceState
    @EnvironmentObject private var gaRouter: GARouter
    
    var parentSize: GeometryProxy
    
    init(_ parentSize: GeometryProxy) {
        self.parentSize = parentSize
    }
    
    var body: some View {
        let horizontalPadding: CGFloat = 4
        let verticalPadding: CGFloat = 12
        let containerWidth: CGFloat = parentSize.size.width - horizontalPadding * 2
        let addReminderButtonSize: CGFloat = 68
        let otherButtonSize: CGFloat = (containerWidth - addReminderButtonSize) / CGFloat(gaBottomTabs.count)
        let containerHeight: CGFloat = parentSize.safeAreaInsets.bottom + otherButtonSize + verticalPadding
        let show = !gaRouter.isActive(.addAgenda)
        
        HStack(
            alignment: .top,
            content: {
                Spacer()
                ForEach(gaBottomTabs, id: \.self) { route in
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
        .offset(y: show ? 0 : containerHeight + 10)
        .animation(.easeInOut(duration: gaAppState.animationDefaultDuration / 2), value: show)
    }
    
    @ViewBuilder
    func GATabItem(route: Routes, buttonSize: CGFloat) -> some View {
        let isActive = gaRouter.isActive(route)
        let isAddAgenda = gaRouter.isActive(.addAgenda)
        
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
                            .if(!isAddAgenda) {
                                $0.animation(
                                    isActive
                                        ? .bouncy(duration: animationDuration, extraBounce: extraBounceRate)
                                        : .linear(duration: animationDuration / 2),
                                    value: isActive
                                )
                            }
                        
                        ZStack {
                            Text(route.name)
                                .multilineTextAlignment(.center)
                                .foregroundColor(isActive ? .yellow1 : .grey2)
                                .gaTypography(.footnote1)
                                .rotation3DEffect(.degrees(isActive ? 0 : 180), axis: (x: 0, y: 1, z: 0))
                                .if(!isAddAgenda) {
                                    $0.animation(.linear(duration: animationDuration), value: isActive)
                                }
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
            withAnimation {
                gaRouter.pushTo(route)
            }
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

private struct BottomBarSizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

#Preview {
    GeometryReader { proxy in
        GABottomBarView(proxy)
            .globalPreviewInjection()
    }
}
