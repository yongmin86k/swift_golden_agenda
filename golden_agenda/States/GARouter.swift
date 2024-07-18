//
//  GARouter.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-07-17.
//  Ref: https://betterprogramming.pub/swiftui-navigation-stack-and-ideal-tab-view-behaviour-e514cc41a029
//  Ref: https://nishbhasin.medium.com/navigationstack-vs-navigationview-in-swiftui-f62f5de86b54

import Foundation

final class GARouter: ObservableObject {
    @Published var selectedTab: Routes = .addAgenda

    func isActive(_ screen: Routes) -> Bool {
        return selectedTab == screen
    }
}
