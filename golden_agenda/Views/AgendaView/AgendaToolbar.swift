//
//  AgendaToolbar.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-07-19.
//

import SwiftUI

@ToolbarContentBuilder
func AgendaToolbar() -> some ToolbarContent {
    ToolbarItem(
        placement: .principal,
        content: {
            HStack {
                Text("Overview")
                    .gaTypography(.title2)

                Image(systemName: "chevron.down")
                    .font(.system(size: 6, weight: .semibold, design: .default))
                    .offset(x: -2)
            }
            .foregroundStyle(.black1)
        }
    )

    ToolbarItem(
        placement: .primaryAction,
        content: {
            Button(
                action: {
                    print("hello")
                }
            ) {
                ZStack {
                    createGAShape(.calendarBlank)
                        .frame(width: 24, height: 24)
                        .offset(x: 2)
                }
                .frame(width: 30, height: 36)
            }
            .foregroundStyle(.black1)
        }
    )
}
