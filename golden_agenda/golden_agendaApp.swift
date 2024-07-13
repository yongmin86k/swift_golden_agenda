//
//  golden_agendaApp.swift
//  golden agenda
//
//  Created by Yongmin Kim on 2024-06-23.
//

import SwiftUI

@main
struct golden_agendaApp: App {
    @StateObject var gaAppState = GAAppState()
    @StateObject var gaDeviceState = GADeviceState()

    @StateObject private var coreDataStack = CoreDataStack.instance

    var body: some Scene {
        WindowGroup {
            GABottomBarView()
                .foregroundColor(.black1)
                .environmentObject(gaAppState)
                .environmentObject(gaDeviceState)
                .environment(\.managedObjectContext,
                             coreDataStack.persistentContainer.viewContext)
        }
    }
}

#Preview {
    GABottomBarView().globalPreviewInjection()
}
