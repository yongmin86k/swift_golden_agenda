//
//  SettingView.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-06-23.
//

import SwiftUI

struct RewardView: View {
    var body: some View {
        Text("Reward")
            .background(WhiteBackdropBlurView())
    }
}

#Preview {
    NavigationStack {
        RewardView()
            .GABackground()
            .toolbar {
                ToolbarItem(
                    placement: .principal,
                    content: {
                        Text("\(Routes.rewards.rawValue.description)")
                            .gaTypography(.title2)
                            .foregroundStyle(.black1)
                    }
                )
            }
    }
}
