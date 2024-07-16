//
//  SettingView.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-06-23.
//  Ref: https://developer.apple.com/documentation/foundation/calendar/2293235-weekdaysymbols

import SwiftUI

struct AgendaView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @EnvironmentObject var gaAppState: GAAppState
    @EnvironmentObject var gaDeviceState: GADeviceState

    // MARK: State variables

    @State var currentAmount = Angle.zero
    @State var backgroundContainerHeight: Double = .zero

    @StateObject private var gaAppStorage = GAAppStorage()
    
    @StateObject var coreDataStack = CoreDataStack.shared

    // MARK: body

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
                        alignment: .top,
                        content: {
                            let draggableHeight = CGFloat(gaDeviceState.screenSize.height * 0.16)

                            AgendaWheel()
                                .rotationEffect(currentAmount)
                                .animation(.smooth(duration: gaAppState.animationDefaultDuration), value: currentAmount)

                            GADottedView(type: .uneven)
                                .padding(.horizontal, 28)
                                .frame(height: backgroundContainerHeight + 16)
                                .offset(y: draggableHeight - 16)

                            VStack(
                                spacing: 0,
                                content: {
                                    DraggableArea(height: draggableHeight)

                                    ContentArea()
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

    // MARK: ContentArea

    @ViewBuilder
    func ContentArea() -> some View {
        GeometryReader { geometry in

            ZStack(
                content: {
                    WhiteBackdropBlurView()
                        .frame(height: backgroundContainerHeight)

                    ScrollView {
                        VStack {
                            // TODO: TESTING
                            Button(
                                action: {
                                    coreDataStack.getCategories()
                                }, label: {
                                    Text("Click to View")
                                }
                            )
                            .padding(32)

                            Button(
                                action: {
                                    coreDataStack.deleteAllCategories()
                                }, label: {
                                    Text("Click to delete all")
                                }
                            )
                            .padding(32)
                            
                            Button(
                                action: {
                                    coreDataStack.addCategory(title: "yayaya", order: 1)
                                }, label: {
                                    Text("Click to add")
                                }
                            )
                            .padding(32)

                            ForEach(coreDataStack.categories) { category in
                                VStack {
                                    Text("\(String(category.order))")

                                    Text(category.title ?? "title")
                                }
                            }
                        }
                    }
                }
            )
            .padding(.horizontal, 16)
            .preference(key: ContentSizePreferenceKey.self, value: geometry.size)
            .onPreferenceChange(ContentSizePreferenceKey.self) { value in
                backgroundContainerHeight = value.height
            }
        }
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

    // MARK: GAToolBarContent

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

private struct ContentSizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

#Preview(traits: .defaultLayout) {
    let gaDeviceState = GADeviceState()

    let previewSize = gaDeviceState.deviceOrientation == .portrait
        ? CGSize(width: 393, height: 759)
        : CGSize(width: 734, height: 372)

    gaDeviceState.screenSize = previewSize

    return AgendaView()
        .environmentObject(GAAppState())
        .environmentObject(gaDeviceState)
}
