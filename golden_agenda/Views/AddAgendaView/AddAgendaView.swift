//
//  SettingView.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-06-23.
//

import SwiftUI

struct AddAgendaView: View {
    @EnvironmentObject private var gaRouter: GARouter

    var body: some View {
        Button(
            action: {
                withAnimation {
                    gaRouter.goBack()
                }
            }, label: {
                Text("add")
            }
        )
    }
}

#Preview {
    AddAgendaView().globalPreviewInjection()
}
