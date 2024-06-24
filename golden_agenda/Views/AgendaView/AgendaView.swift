//
//  SettingView.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-06-23.
//

import SwiftUI

struct AgendaView: View {
    var body: some View {
        let date = Date()
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)

        NavigationStack {
            VStack {
                HStack {
                    GATagView(text: "\(year)")
                    Text("\(month)")
                        .foregroundStyle(.grey2)
                        .font(
                            .system(size: 59, weight: .thin, design: .default)
                        )
                    GATagView(text: "Today")
                }

                Spacer()
            }
            .GABackground()
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(
                    placement: .principal,
                    content: {
                        HStack {
                            Text("Overview")
                                .font(.title2)
                                .fontWeight(.semibold)

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
                                print(year, month)
                            }
                        ) {
                            ZStack {
                                createGAShape(type: .calendarBlankShape)
                                    .frame(width: 24, height: 24)
                                    .offset(x: 2)
                            }
                            .frame(width: 30, height: 36)
                        }
                        .foregroundStyle(.black1)
                    }
                )
            }
        }
    }
}

#Preview {
    AgendaView()
}
