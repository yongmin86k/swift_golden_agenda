//
//  SettingView.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-06-23.
//

import SwiftUI

struct AddAgendaView: View {
    @EnvironmentObject private var gaDeviceState: GADeviceState
    @EnvironmentObject private var gaRouter: GARouter

//    @State private var dottedViewSize = CGSize.zero
    @State private var title = ""

    var body: some View {
        let show = gaRouter.isActive(.addAgenda)

        GeometryReader { _ in
//            let backgroundHeight = gaDeviceState.screenSize.height - ($0.safeAreaInsets.top)
            let backgroundHeight = gaDeviceState.screenSize.height

//            let _ = print("\(gaDeviceState.screenSize.height), \($0.safeAreaInsets.top)")

            ZStack(
                alignment:
                Alignment(
                    horizontal: .center,
                    vertical: .bottom
                )
            ) {
                Color.clear

                GADottedView(.uneven)
//                    .safeAreaPadding(.top)
                    .frame(height: backgroundHeight)
                    .padding(.horizontal, 28)
                    .offsetWithAnimation(.background, show, 0, backgroundHeight)
                    .animation(.easeInOut(duration: 0.7), value: show)

//                    .ignoresSafeArea(.keyboard)

                AddOrEditForm(show, backgroundHeight)

//            WhiteBackdropBlurView()
//                .padding(.horizontal, 4)
//                .frame(height: 200)
            }

//            .edgesIgnoringSafeArea(.bottom)
        }
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
                            gaRouter.goBack()
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
                .frame(maxWidth: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)

                ScrollView {
                    Label {
                        Text("Title")
                    } icon: {
                        createGAShape(.checkboxMarkedCirclePlusOutline)
                            .frame(width: 24, height: 24)
                    }
                    .labelStyle(GALabelStyle())

                    TextField("My agenda", text: $title)
                        .gaTypography(.input1)
                        .padding(.horizontal, 32)
                        .padding(.vertical, 12)
                        .background(
                            Capsule()
                                .fill(.grey1)
                        )
                        .lineLimit(1)
                        .onAppear {
                            UITextField.appearance().clearButtonMode = .whileEditing
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

#Preview {
    let gaDeviceState = GADeviceState()

    let previewSize = gaDeviceState.deviceOrientation == .portrait
        ? CGSize(width: 393, height: 759)
        : CGSize(width: 734, height: 372)

    gaDeviceState.screenSize = previewSize

    let gaRouter = GARouter()

    gaRouter.pushTo(.addAgenda)

    return AddAgendaView()
        .GABackground()
        .environmentObject(GAAppState())
        .environmentObject(gaDeviceState)
        .environmentObject(gaRouter)
}
