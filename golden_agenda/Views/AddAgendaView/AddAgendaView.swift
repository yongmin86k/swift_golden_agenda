//
//  SettingView.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-06-23.
//  Ref: https://www.hackingwithswift.com/quick-start/swiftui/how-to-run-some-code-when-state-changes-using-onchange
//  Ref: https://stackoverflow.com/questions/56491386/how-to-hide-keyboard-when-using-swiftui

import SwiftUI

// TODO: Create a form component - https://blog.logrocket.com/building-forms-swiftui-comprehensive-guide/
struct AddAgendaView: View {
    @EnvironmentObject private var gaDeviceState: GADeviceState
    @EnvironmentObject private var gaRouter: GARouter

    @StateObject private var gaAppStorage = GAAppStorage()

//    TODO: use agenda instance
    @State private var title = ""
    @State private var reward = 0
    @State private var penalty = 0
    @State private var openCategory = false
    @State private var openDetails = false
    @State private var openDate = false
    @State private var openTime = false
    @State private var openLocation = false

    @FocusState private var focusedField: FocusedFields?

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
                        withAnimation {
                            close()
                        }
                    }, label: {
                        Circle()
                            .fill(LinearGradient(gradient: Gradient(colors: [.grey1.opacity(0), .grey1]), startPoint: .top, endPoint: .bottom))
                            .frame(width: 24, height: 24)
                            .overlay {
                                Image(systemName: "xmark")
                                    .font(.system(size: 12))
                                    .fontWeight(.bold)
                            }
                    }
                )
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .trailing)

                ScrollView {
                    VStack(spacing: 0) {
                        Label { Text("Title") } icon: { createGAShape(.checkboxMarkedCirclePlusOutline).frame(width: 24, height: 24) }
                            .labelStyle(GALabelStyle())
                            .padding(.bottom, 8)

                        // TODO: custom clear button
//                        .onAppear {
//                            UITextField.appearance().clearButtonMode = .whileEditing
//                        }
                        TextField("My agenda", text: $title)
                            .modifier(GATextFieldStyle($focusedField, .title))
                            .onTapGesture { focusedField = .title }
                            .onChange(of: show) { if show == true { focusedField = .title }}
                            .padding(.bottom, 24)

                        HStack(spacing: 16) {
                            VStack {
                                Label { Text("Reward") } icon: { createGAShape(.giftOutline).frame(width: 24, height: 24) }
                                    .labelStyle(GALabelStyle())

                                TextField("\(gaAppStorage.defaultRewardPoint)", value: $reward, format: .number)
                                    .modifier(GATextFieldStyle($focusedField, .reward))
                                    .onTapGesture { focusedField = .reward }
                                    .keyboardType(.numberPad)
                                    .labelStyle(GALabelStyle())
                            }

                            VStack {
                                Label { Text("Penalty") } icon: { createGAShape(.heartMinusOutline).frame(width: 24, height: 24) }
                                    .labelStyle(GALabelStyle())

                                TextField("\(gaAppStorage.defaultPenaltyPoint)", value: $penalty, format: .number)
                                    .modifier(GATextFieldStyle($focusedField, .penalty))
                                    .onTapGesture { focusedField = .penalty }
                                    .keyboardType(.numberPad)
                                    .labelStyle(GALabelStyle())
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

    private func close() {
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

private struct GALabelStyle: LabelStyle {
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

private struct GATextFieldStyle: ViewModifier {
    var focusedField: FocusState<FocusedFields?>.Binding
    var field: FocusedFields

    init(_ focusedField: FocusState<FocusedFields?>.Binding, _ field: FocusedFields) {
        self.focusedField = focusedField
        self.field = field
    }

    func body(content: Content) -> some View {
        content
            .lineLimit(1)
            .focused(focusedField, equals: field)
            .gaTypography(.input1)
            .padding(.horizontal, 32)
            .padding(.vertical, 12)
            .background(Capsule().fill(.grey1))
            .contentShape(Capsule())
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
