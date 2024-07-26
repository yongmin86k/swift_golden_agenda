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

struct GATextField<S>: View where S: Hashable {
    var placeholder: LocalizedStringKey
    var focused: S
    var focusedState: FocusState<S?>.Binding
    var text: Binding<String>?
    var numberValue: Binding<Int?>?

    init(placeholder: LocalizedStringKey, focused: S, focusedState: FocusState<S?>.Binding, text: Binding<String>) {
        self.placeholder = placeholder
        self.focused = focused
        self.focusedState = focusedState
        self.text = text
        self.numberValue = nil
    }

    init(placeholder: LocalizedStringKey, focused: S, focusedState: FocusState<S?>.Binding, numberValue: Binding<Int?>) {
        self.placeholder = placeholder
        self.focused = focused
        self.focusedState = focusedState
        self.text = nil
        self.numberValue = numberValue
    }

//    var value: Binding<String>

//    var value: F.FormatInput?
//    var format: F?
//    @Binding var numberValue: F.FormatInput?

    var body: some View {
        HStack {
            if text != nil {
                TextField(placeholder, text: text!)
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
        .padding(.horizontal, 32)
        .padding(.vertical, 12)
        .background(Capsule().fill(.grey1))
        .contentShape(Capsule())
    }
}

private struct GATextFieldModifier<S>: ViewModifier where S: Hashable {
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
                placeholder: "title", focused: .title, focusedState: $focusedState, text: $text)
                .onTapGesture { focusedState = .title }

            GATextField<FocusedFields>(
                placeholder: "0", focused: .reward, focusedState: $focusedState, numberValue: $num)
                .onTapGesture { focusedState = .reward }
        }
        .padding()
    }
}

#Preview {
    GATextFieldPreview()
}
