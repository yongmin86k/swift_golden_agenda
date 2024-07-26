//
//  SettingView.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-06-23.
//  Ref: https://www.hackingwithswift.com/quick-start/swiftui/how-to-run-some-code-when-state-changes-using-onchange
//  Ref: https://stackoverflow.com/questions/56491386/how-to-hide-keyboard-when-using-swiftui

import SwiftUI

struct AddAgendaView: View {
    @EnvironmentObject private var gaDeviceState: GADeviceState
    @EnvironmentObject private var gaRouter: GARouter

    @StateObject private var createAgenda = CreateAgenda()
    @State private var openCategory = false
    @State private var openDetails = false
    @State private var openDate = false
    @State private var openTime = false
    @State private var openLocation = false

    @FocusState private var focusedState: FocusedFields?

    var body: some View {
        let show = gaRouter.isActive(.addAgenda)
        let backgroundHeight = gaDeviceState.screenSize.height

        ZStack(
            alignment:
            Alignment(
                horizontal: .center,
                vertical: .bottom
            )
        ) {
            Color.clear

            GADottedView(.uneven)
                .padding(.horizontal, 28)
                .frame(height: backgroundHeight)
                .offsetWithAnimation(.background, show, 0, backgroundHeight)

            AddOrEditForm(show, backgroundHeight)

            AssistBar().padding(.bottom, gaDeviceState.keyboardHeight)
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
        .ignoresSafeArea(.all)
    }

    @ViewBuilder
    func AddOrEditForm(_ show: Bool, _ backgroundHeight: CGFloat) -> some View {
        let height = backgroundHeight - 16

        ZStack {
            WhiteBackdropBlurView()

            VStack(alignment: .leading) {
                Button(
                    action: {
                        withAnimation {close()}
                    }, label: {
                        Circle()
                            .fill(LinearGradient(gradient: Gradient(colors: [.grey1.opacity(0), .grey1]), startPoint: .top, endPoint: .bottom))
                            .frame(width: 24, height: 24)
                            .overlay {
                                Image(systemName: "xmark")
                                    .font(.system(size: 12))
                                    .fontWeight(.bold)
                                    .foregroundColor(.black1)
                            }
                    }
                )
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .trailing)

                ScrollView {
                    VStack(spacing: 0) {
                        Label { Text("Title") } icon: { createGAShape(.checkboxMarkedCirclePlusOutline).frame(width: 24, height: 24) }
                            .labelStyle(GALabelStyle1())
                            .padding(.bottom, 8)

                        GATextField<FocusedFields>(
                            placeholder: "My agenda",
                            focused: .title,
                            focusedState: $focusedState,
                            isFocused: focusedState == .title,
                            text: $createAgenda.title,
                            removeText: {createAgenda.title = ""}
                        )
                        .onTapGesture { focusedState = .title }
                        .onChange(of: show) { if show == true { focusedState = .title }}
                        .onSubmit { focusedState = .reward }
                        .padding(.bottom, 24)

                        HStack(spacing: 16) {
                            VStack {
                                Label { Text("Reward") } icon: { createGAShape(.giftOutline).frame(width: 24, height: 24) }
                                    .labelStyle(GALabelStyle1())

                                GATextField<FocusedFields>(
                                    placeholder: "0",
                                    focused: .reward,
                                    focusedState: $focusedState,
                                    isFocused: focusedState == .reward,
                                    numberValue: $createAgenda.pointEarned
                                )
                                .onTapGesture { focusedState = .reward }
                                .onSubmit { focusedState = .penalty }
                                .keyboardType(.numberPad)
                                .labelStyle(GALabelStyle1())
                            }

                            VStack {
                                Label { Text("Penalty") } icon: { createGAShape(.heartMinusOutline).frame(width: 24, height: 24) }
                                    .labelStyle(GALabelStyle1())

                                GATextField<FocusedFields>(
                                    placeholder: "0",
                                    focused: .penalty,
                                    focusedState: $focusedState,
                                    isFocused: focusedState == .penalty,
                                    numberValue: $createAgenda.pointLost
                                )
                                .onTapGesture { focusedState = .penalty }
                                .onSubmit { focusedState = nil }
                                .keyboardType(.numberPad)
                                .labelStyle(GALabelStyle1())
                            }
                        }

                        Divider().overlay(Color.grey2).padding(.vertical, 16)

                        Toggle("Category", isOn: $openCategory).toggleStyle(GAToggleStyle(shape: .shapePlusOutline))
                            .padding(.bottom, 24)

                        Toggle("Details", isOn: $openDetails).toggleStyle(GAToggleStyle(shape: .textBoxOutline))
                            .padding(.bottom, 24)

                        Toggle("Date (repeat)", isOn: $openDate).toggleStyle(GAToggleStyle(shape: .calendarRefresh))
                            .padding(.bottom, 24)

                        Toggle("Time", isOn: $openTime).toggleStyle(GAToggleStyle(shape: .watchLater))
                            .padding(.bottom, 24)

                        Toggle("Location", isOn: $openLocation).toggleStyle(GAToggleStyle(shape: .mapMarkerOutline))
                            .padding(.bottom, 24)
                    }
                }
                .padding(.horizontal, 16)
                .scrollClipDisabled()
            }
        }
        .padding(.horizontal, 16)
        .frame(height: max(height, 0))
        .clipped()
        .offsetWithAnimation(.foreground, show, 0, height)
    }

    @ViewBuilder
    func AssistBar() -> some View {
        Group {
            HStack {
                Button(
                    action: { close() },
                    label: {
                        Label("Cancel", systemImage: "xmark")
                            .labelStyle(GALabelStyle2(color: .yellow1))
                    }
                )
                .padding(.horizontal, 8)
                .padding(.vertical, 12)
                .contentShape(Rectangle())

                Spacer()

                Button(
                    action: {
                        createAgenda.reset()
                        focusedState = nil
                    },
                    label: {
                        Label {
                            Text("Clear all")
                        } icon: {
                            createGAShape(.restore)
                                .frame(width: 16, height: 16, alignment: .center)
                        }
                        .labelStyle(GALabelStyle2(color: .yellow1))
                    }
                )
                .padding(.horizontal, 8)
                .padding(.vertical, 12)
                .contentShape(Rectangle())

                Spacer()

                Button(
                    action: {
                        createAgenda.reset()
                        focusedState = nil
                    },
                    label: {
                        Label {
                            Text("Add")
                        } icon: {
                            createGAShape(.checkboxMarkedCirclePlusOutline)
                                .frame(width: 16, height: 16, alignment: .center)
                        }
                        .labelStyle(GALabelStyle2(color: .white))
                    }
                )
                .padding(.horizontal, 32)
                .padding(.vertical, 14)
                .background(Capsule().fill(.yellow1))
                .contentShape(Rectangle())
                .gaShadowStyle1()
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .if(gaDeviceState.keyboardHeight == 0) {
                $0.safeAreaPadding(.bottom)
            }
        }
        .background(WhiteBackdropBlurView())
        .padding(.horizontal, 4)
    }

    private func close() {
        focusedState = nil

        gaRouter.goBack()

        UIApplication.shared.endEditing()
    }
}

private enum FocusedFields: Hashable {
    case title
    case reward
    case penalty
    case details
}

private struct GALabelStyle1: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 8) {
            configuration.icon
            configuration.title
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
        .gaTypography(.body1)
        .fontWeight(.bold)
    }
}

private struct GALabelStyle2: LabelStyle {
    var color: Color

    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 4) {
            configuration.icon
            configuration.title
        }
        .lineLimit(1)
        .fixedSize(horizontal: false, vertical: true)
        .gaTypography(.footnote1)
        .foregroundColor(color)
        .fontWeight(.bold)
    }
}

#Preview {
    let gaDeviceState = GADeviceState()

    let previewSize = gaDeviceState.deviceOrientation == .portrait
        ? CGSize(width: 393, height: 759)
        : CGSize(width: 734, height: 372)

    gaDeviceState.screenSize = previewSize

    let gaRouter = GARouter()

    gaRouter.pushTo(.addAgenda)

    return NavigationStack {
        AddAgendaView()
            .environmentObject(GAAppState())
            .environmentObject(gaDeviceState)
            .environmentObject(gaRouter)
            .GABackground()
            .toolbar {
                ToolbarItem(
                    placement: .principal,
                    content: {
                        Text("\(Routes.agenda.rawValue.description)")
                            .gaTypography(.title2)
                            .foregroundStyle(.black1)
                    }
                )
            }
            .navigationBarTitleDisplayMode(.inline)
    }
}
