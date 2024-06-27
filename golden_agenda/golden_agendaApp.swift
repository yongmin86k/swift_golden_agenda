//
//  golden_agendaApp.swift
//  golden agenda
//
//  Created by Yongmin Kim on 2024-06-23.
//

import SwiftUI

@main
struct golden_agendaApp: App {
    @StateObject var gaAppStore = GAAppStore()
    
    var body: some Scene {
        WindowGroup {
            GABottomBarView()
                .foregroundColor(.black1)
                .environmentObject(gaAppStore)
        }
    }
}

#Preview {
    GABottomBarView().environmentObject(GAAppStore())
}
