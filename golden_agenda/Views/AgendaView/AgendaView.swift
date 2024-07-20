//
//  SettingView.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-06-23.
//  Ref: https://developer.apple.com/documentation/foundation/calendar/2293235-weekdaysymbols

import SwiftUI

struct AgendaView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @EnvironmentObject private var gaAppState: GAAppState
    @EnvironmentObject private var gaDeviceState: GADeviceState
    @EnvironmentObject private var gaRouter: GARouter

    @StateObject private var gaAppStorage = GAAppStorage()
    @StateObject private var coreDataStack = CoreDataStack.shared

    // MARK: State variables

    @State private var currentAmount = Angle.zero
    @State private var backgroundContainerHeight = CGFloat.zero

    // MARK: body

    var body: some View {
        let date = gaAppState.selectedDate
        let calendar = Calendar.current
        let year: Int = calendar.component(.year, from: date)
        let month: Int = calendar.component(.month, from: date)

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
                    alignment: .top,
                    content: {
                        let draggableHeight = CGFloat(gaDeviceState.screenSize.height * 0.16)
                        let startOffset = draggableHeight - 16
                        let show = gaRouter.isActive(.agenda)

                        AgendaWheel()
                            .rotationEffect(currentAmount)
                            .animation(.smooth(duration: gaAppState.animationDefaultDuration), value: currentAmount)

                        GADottedView(.uneven)
                            .frame(height: backgroundContainerHeight + 16)
                            .padding(.horizontal, 28)
                            .offsetWithAnimation(.background, show, startOffset, startOffset + backgroundContainerHeight)

                        VStack(
                            spacing: 0,
                            content: {
                                DraggableArea(height: draggableHeight)

                                ContentArea()
                                    .offsetWithAnimation(.foreground, show, 0, backgroundContainerHeight)
                            }
                        )
                    }
                )
            }
        )
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: ContentArea

    @ViewBuilder
    func ContentArea() -> some View {
        ZStack {
            WhiteBackdropBlurView().readSize { backgroundContainerHeight = $0.height }

            AgendaOverviewView()
        }
        .padding(.horizontal, 16)
    }

    // MARK: DraggableArea

    @ViewBuilder
    func DraggableArea(height: CGFloat) -> some View {
        let date = gaAppState.selectedDate
        let calendar = Calendar.current
        let weekdayIndex: Int = calendar.component(.weekday, from: date) - 1
        let dayName: String = DateFormatter().weekdaySymbols[weekdayIndex]

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
                // TODO: add a thousand separator
                let curentPoint = String(gaAppStorage.currentPoint)

                Spacer()

                Text(dayName)
                    .gaTypography(.footnote2)
                    .foregroundStyle(.black1)
                    .textCase(.uppercase)

                HStack(
                    spacing: 20,
                    content: {
                        Text("Current points")
                            .gaTypography(.footnote2)
                            .foregroundStyle(.grey2)

                        Text(curentPoint)
                            .gaTypography(.footnote2)
                            .multilineTextAlignment(.trailing)
                            .foregroundStyle(.yellow1)
                    }
                )

                Color.clear.frame(height: 24)
            }
        )
        .frame(height: height)
        .contentShape(Rectangle())
        .gesture(gesture)
    }
}

#Preview(traits: .defaultLayout) {
    let gaDeviceState = GADeviceState()

    // TODO: read preview name
    let previewSize = gaDeviceState.deviceOrientation == .portrait
        ? CGSize(width: 393, height: 759)
        : CGSize(width: 734, height: 372)

    gaDeviceState.screenSize = previewSize

    return NavigationStack {
        AgendaView()
            .environmentObject(GAAppState())
            .environmentObject(gaDeviceState)
            .environmentObject(GARouter())
            .GABackground()
            .toolbar {
                AgendaToolbar()
            }
    }
}
