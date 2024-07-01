//
//  SettingView.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-06-23.
//

import SwiftUI

struct AgendaView: View {
    @EnvironmentObject var gaAppState: GAAppState
    @EnvironmentObject var gaDeviceState: GADeviceState

    @State var currentAmount = Angle.zero

    var body: some View {
        let date = gaAppState.selectedDate
        let calendar = Calendar.current
        let year: Int = calendar.component(.year, from: date)
        let month: Int = calendar.component(.month, from: date)

        NavigationStack {
            VStack(
                alignment: .center,
                spacing: 0,
                content: {
                    ZStack {
                        HStack {
                            Button(action: {}, label: { GATagView(text: "\(year)") })

                            Spacer()

                            Button(
                                action: {
                                    withAnimation { gaAppState.selectedDate = Date() }
                                },
                                label: { GATagView(text: "Today") }
                            )
                        }

                        Button(action: {}, label: {
                            Text("\(month)".paddingStart(length: 2, chars: "0"))
                                .foregroundStyle(.grey2)
                                .font(
                                    .system(size: 59, weight: .thin, design: .default)
                                )
                        })
                    }
                    .safeAreaPadding(.horizontal)
                    .clipped()

                    ZStack(
                        alignment: Alignment(horizontal: .center, vertical: .top),
                        content: {
                            AgendaWheel()
                                .rotationEffect(currentAmount)
                                .animation(.smooth(duration: gaAppState.animationDefaultDuration), value: currentAmount)

                            VStack(
                                spacing: 0,
                                content: {
                                    DraggableArea()

                                    Group {
                                        WhiteBackdropBlurView()
                                    }
                                    .padding(.horizontal, 16)
                                }
                            )
                        }
                    )
                }
            )
            .GABackground()
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: GAToolBarContent)
        }
    }

    @ViewBuilder
    func DraggableArea() -> some View {
        let date = gaAppState.selectedDate
        let calendar = Calendar.current
        let weekdayIndex: Int = calendar.component(.weekday, from: date) - 1
        let dayName: String = DateFormatter().weekdaySymbols[weekdayIndex]
        // Ref: https://developer.apple.com/documentation/foundation/calendar/2293235-weekdaysymbols

        let height = CGFloat(gaDeviceState.screenSize.height * 0.16)

        let gesture = DragGesture()
            .onChanged { value in
                let moveBy = Angle.degrees(value.translation.width) / 5

                currentAmount = moveBy
            }
            .onEnded { _ in
                withAnimation {
                    let offsetIndex = Int((-currentAmount.degrees / 12).rounded(.toNearestOrAwayFromZero))
                    let newIndex = gaAppState.selectedDateIndex + offsetIndex
                    gaAppState.selectedDate = gaAppState.dateInWheel[newIndex]

                    currentAmount = .zero
                }
            }

        VStack(
            alignment: .center,
            content: {
                Spacer()

                Text(dayName)
                    .gaTypography(.footnote2)
                    .foregroundStyle(.black1)
                    .textCase(.uppercase)
                    .padding(.bottom, 2)

                HStack(
                    spacing: 20,
                    content: {
                        Text("Current points")
                            .gaTypography(.footnote2)
                            .foregroundStyle(.grey2)

                        Text("0")
                            .gaTypography(.footnote2)
                            .multilineTextAlignment(.trailing)
                            .foregroundStyle(.yellow1)
                    }
                )

                Color.clear.frame(height: 16)
            }
        )
        .frame(height: height)
        .contentShape(Rectangle())
        .gesture(gesture)
    }

    @ToolbarContentBuilder
    func GAToolBarContent() -> some ToolbarContent {
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
                        print(gaAppState.selectedDate)
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

#Preview(traits: .defaultLayout) {
    var gaDeviceState = GADeviceState()

    let previewSize = gaDeviceState.deviceOrientation == .portrait
        ? CGSize(width: 393, height: 759)
        : CGSize(width: 734, height: 372)

    gaDeviceState.screenSize = previewSize

    return AgendaView()
        .environmentObject(GAAppState())
        .environmentObject(gaDeviceState)
}
