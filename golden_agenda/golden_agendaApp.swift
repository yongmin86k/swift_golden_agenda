//
//  golden_agendaApp.swift
//  golden agenda
//
//  Created by Yongmin Kim on 2024-06-23.
//  Ref: https://stackoverflow.com/questions/77366385/how-to-bind-environment-globally-to-all-swiftui-previews

import SwiftUI

@main
struct golden_agendaApp: App {
    @StateObject private var gaAppState = GAAppState()
    @StateObject private var gaDeviceState = GADeviceState()
    @StateObject private var gaRouter = GARouter()

    @StateObject private var coreDataStack = CoreDataStack.shared

    var body: some Scene {
        WindowGroup {
            GAContentView()
                .foregroundColor(.black1)
                .background(Color.grey1)
                .environment(\.managedObjectContext,
                             coreDataStack.persistentContainer.viewContext)
                .environmentObject(gaAppState)
                .environmentObject(gaDeviceState)
                .environmentObject(gaRouter)
        }
    }
}

#Preview {
    GAContentView().globalPreviewInjection()
}
