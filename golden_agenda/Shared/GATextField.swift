//
//  GATextField.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-07-24.
//  Ref: https://github.com/jcbriones/SwiftUI-FormValidation
//  Ref: https://ampersandsoftworks.com/posts/from-strings-to-data-using-parseableformatstyle/
//  Ref: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/initialization/
//  Ref: https://www.swiftbysundell.com/tips/struct-convenience-initializers/

import SwiftUI

struct GATextField<S: Hashable>: View {
    var placeholder: LocalizedStringKey
    var focused: S
    var focusedState: FocusState<S?>.Binding
    var isFocused: Bool
    var text: Binding<String>?
    var numberValue: Binding<Int?>?

    @State private var onEditing = false

    init(placeholder: LocalizedStringKey, focused: S, focusedState: FocusState<S?>.Binding, isFocused: Bool, text: Binding<String>) {
        self.placeholder = placeholder
        self.focused = focused
        self.focusedState = focusedState
        self.isFocused = isFocused
        self.text = text
        self.numberValue = nil
    }

    init(placeholder: LocalizedStringKey, focused: S, focusedState: FocusState<S?>.Binding, isFocused: Bool, numberValue: Binding<Int?>) {
        self.placeholder = placeholder
        self.focused = focused
        self.focusedState = focusedState
        self.isFocused = isFocused
        self.text = nil
        self.numberValue = numberValue
    }

    var body: some View {
        HStack {
            if text != nil {
                TextField(placeholder, text: text!, onEditingChanged: { onEditing = $0 })
                    .modifier(GATextFieldModifier(focused, focusedState))

                // TODO: custom clear button
//                        .onAppear {
//                            UITextField.appearance().clearButtonMode = .whileEditing
//                        }
            }

            if numberValue != nil {
                TextField(placeholder, value: numberValue!, format: .number)
                    .modifier(GATextFieldModifier(focused, focusedState, true))

                Text("Points").gaTypography(.footnote2)
            }
        }
        .modifier(GATextFieldStyleModifier(isFocused))
    }
}

private struct GATextFieldModifier<S: Hashable>: ViewModifier {
    var focused: S
    var focusedState: FocusState<S?>.Binding
    var isNumberPad: Bool

    init(_ focused: S, _ focusedState: FocusState<S?>.Binding, _ isNumberPad: Bool = false) {
        self.focused = focused
        self.focusedState = focusedState
        self.isNumberPad = isNumberPad
    }

    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(isNumberPad ? .trailing : .leading)
            .lineLimit(1)
            .focused(focusedState, equals: focused)
            .gaTypography(.input1)
    }
}

private struct GATextFieldStyleModifier: ViewModifier {
    @EnvironmentObject private var gaAppState: GAAppState

    var isFocused: Bool

    init(_ isFocused: Bool) {
        self.isFocused = isFocused
    }

    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 32)
            .padding(.vertical, 12)
            .background(
                Capsule()
                    .fill(isFocused ? .clear : .grey1)
                    .if(isFocused) {
                        $0.stroke(.yellow1, lineWidth: 1)
                    }
                    .animation(.linear(duration: gaAppState.animationDefaultDuration / 2), value: isFocused)
            )
            .contentShape(Capsule())
    }
}

private struct GATextFieldPreview: View {
    enum FocusedFields: Hashable {
        case title
        case reward
    }

    @FocusState var focusedState: FocusedFields?
    @State var text = ""
    @State var num: Int?

    var body: some View {
        VStack {
            GATextField<FocusedFields>(
                placeholder: "title", focused: .title, focusedState: $focusedState, isFocused: focusedState == .title, text: $text)
                .onTapGesture { withAnimation { focusedState = .title }}

            GATextField<FocusedFields>(
                placeholder: "0", focused: .reward, focusedState: $focusedState, isFocused: focusedState == .reward, numberValue: $num)
                .onTapGesture { withAnimation { focusedState = .reward } }
        }
        .padding()
    }
}

#Preview {
    GATextFieldPreview()
        .environmentObject(GAAppState())
}
