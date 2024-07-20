//
//  GARouter.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-07-17.
//  Ref: https://betterprogramming.pub/swiftui-navigation-stack-and-ideal-tab-view-behaviour-e514cc41a029
//  Ref: https://nishbhasin.medium.com/navigationstack-vs-navigationview-in-swiftui-f62f5de86b54
//  Ref: https://betterprogramming.pub/working-around-the-shortfalls-of-swiftuis-tabview-ac9aa2a9d894

import SwiftUI

var gaBottomTabs: [Routes] = [
    Routes.agenda,
    Routes.rewards,
    Routes.addAgenda,
    Routes.reports,
    Routes.settings,
]

final class GARouter: ObservableObject {
    @Published var routes = [Routes]()

    var selectedTab: Routes {
        return routes.last ?? .agenda
    }

    func isActive(_ route: Routes) -> Bool {
        return selectedTab == route
    }

    func pushTo(_ route: Routes) {
        if routes.contains(route) {
            routes = routes.filter { $0 != route }
        }

        routes.append(route)
    }

    func goBack() {
        _ = routes.popLast()
    }
}
