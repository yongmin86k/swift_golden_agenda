//
//  GABottomBarView.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-06-23.
//

import SwiftUI

var tabs = [
    Routes.reminders,
    Routes.rewards,
    Routes.addReminders,
    Routes.reports,
    Routes.settings,
]

struct GABottomBarView: View {
    @State var selectedTab = Routes.reminders
    
    var showBottomTab: Bool = true
    
    var body: some View {
        GeometryReader { size in
            let paddingTop = size.safeAreaInsets.top
            
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                
                TabView(selection: $selectedTab) {
                    ForEach(tabs, id: \.self) { route in
                        ZStack {
                            Color.grey1
                            
                            WhiteBackdropBlurView()
                                .padding(EdgeInsets(top: paddingTop, leading: 16, bottom: 0, trailing: 16))
                            
                            Text("screen name: \n\(route.name)")
                                .multilineTextAlignment(.center)
                            
                        }
                        .ignoresSafeArea()
                        .tag(route)
                    }
                }
                
                GATabBar(parentSize: size)
            }
            .ignoresSafeArea()
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
        
        GeometryReader { geometry in
            HStack(
                spacing: 0,
                content: {
                    ForEach(tabs, id: \.self) {route in
                        GeometryReader { reader in
                            let isAddReminderRoute = route == Routes.addReminders
                            let buttonSize = isAddReminderRoute ? addReminderButtonSize : otherButtonSize
                            
                            if isAddReminderRoute
                            {
                                FloatActionButton(route: route, buttonSize: buttonSize)
                            } else {
                                GATabItem(route: route, buttonSize: buttonSize)
                            }
                        }
                    }
                    
                })
            .background{
                WhiteBackdropBlurView()
            }
        }
        .padding(.horizontal, horizontalPadding)
        .frame(height: containerHeight)
    }
    
    @ViewBuilder
    func GATabItem(route: Routes, buttonSize: CGFloat) -> some View {
        @State var isActive = route == selectedTab
        
        HStack(
            alignment: .center,
            content: {
                Spacer()
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
                                ? .bouncy(duration: 0.3, extraBounce: 0.5)
                                : .linear(duration: 0.15),
                                value: isActive
                            )
                        
                        ZStack {
                            Text(route.name)
                                .multilineTextAlignment(.center)
                                .foregroundColor(isActive ? .yellow1 : .grey2)
                                .dynamicTypeSize(.xSmall)
                                .fontWeight(.semibold)
                                .rotation3DEffect(.degrees(isActive ? 0 : 180), axis: (x: 0, y: 1, z: 0))
                                .animation(.linear(duration: 0.3), value: isActive)
                                .opacity(isActive ? 1 : 0)
                            
                            createTogShape(type: route.shape)
                                .foregroundColor(isActive ? .yellow1 : .grey2)
                                .frame(width: 24, height: 24)
                                .opacity(isActive ? 0 : 1)
                                .animation(.linear(duration: 0.15), value: isActive)
                        }
                        .frame(width: buttonSize, height: buttonSize)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            withAnimation() {
                                selectedTab = route
                            }
                        }
                    })
                Spacer()
            }
        )
    }
    
    @ViewBuilder
    func FloatActionButton(route: Routes, buttonSize: CGFloat) -> some View {
        let tabGesture = TapGesture().onEnded {
            selectedTab = route
        }
        
        HStack {
            Spacer()
            ZStack(
                alignment: Alignment(horizontal: .center, vertical: .center),
                content: {
                    Rectangle()
                        .fill(
                            AngularGradient(gradient: Gradient(colors: [.yellow1, .yellow2, .yellow1]), center: .center, startAngle: .degrees(45), endAngle: .degrees(405))
                        )
                        .frame(width: buttonSize,height: buttonSize)
                        .cornerRadius(26.0)
                        .shadow(color: .black.opacity(0.32), radius: 12, y: 2)
                    
                    Image(systemName: "plus")
                        .font(Font.title.weight(.regular))
                        .foregroundColor(.white)
                }
            ).offset(y: -10)
            Spacer()
        }
        .gesture(tabGesture)
    }
}

#Preview {
    GABottomBarView()
}

