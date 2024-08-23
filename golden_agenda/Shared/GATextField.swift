//
//  GATextField.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-07-24.
//  Ref: https://github.com/jcbriones/SwiftUI-FormValidation
//  Ref: https://ampersandsoftworks.com/posts/from-strings-to-data-using-parseableformatstyle/
//  Ref: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/initialization/
//  Ref: https://www.swiftbysundell.com/tips/struct-convenience-initializers/
//  Ref: https://www.swiftcraft.io/articles/a-closer-look-at-interactive-animations-in-swiftui

import SwiftUI

protocol GATextFieldContainer: View {
    associatedtype F: Hashable

    var placeholder: LocalizedStringKey { get }
    var focused: F { get }
    var focusedState: FocusState<F?>.Binding { get }
    var isFocused: Bool { get }
    var errorMessage: String? { get }
    var text: Binding<String>? { get }
    var numberValue: Binding<Int?>? { get }
    var onRemoveText: (() -> Void)? { get }
    var onChange: (() -> Void)? { get }
}

struct GATextField<F: Hashable>: GATextFieldContainer {
    @EnvironmentObject private var gaAppState: GAAppState

    var placeholder: LocalizedStringKey
    var focused: F
    var focusedState: FocusState<F?>.Binding
    var isFocused: Bool
    var errorMessage: String?
    var text: Binding<String>?
    var numberValue: Binding<Int?>?
    var onRemoveText: (() -> Void)?
    var onChange: (() -> Void)?

    init(
        placeholder: LocalizedStringKey,
        focused: F,
        focusedState: FocusState<F?>.Binding,
        isFocused: Bool,
        errorMessage: String? = nil,
        text: Binding<String>,
        onRemoveText: (() -> Void)? = nil,
        onChange: (() -> Void)? = nil
    ) {
        self.placeholder = placeholder
        self.focused = focused
        self.focusedState = focusedState
        self.isFocused = isFocused
        self.errorMessage = errorMessage
        self.text = text
        self.numberValue = nil
        self.onRemoveText = onRemoveText
        self.onChange = onChange
    }

    init(
        placeholder: LocalizedStringKey,
        focused: F,
        focusedState: FocusState<F?>.Binding,
        isFocused: Bool,
        errorMessage: String? = nil,
        numberValue: Binding<Int?>
    ) {
        self.placeholder = placeholder
        self.focused = focused
        self.focusedState = focusedState
        self.isFocused = isFocused
        self.errorMessage = errorMessage
        self.numberValue = numberValue
    }

    var body: some View {
        let hasError: Bool = ((errorMessage?.isEmpty) == false)

        VStack(spacing: 0) {
            HStack {
                if text != nil {
                    HStack(spacing: 0) {
                        TextField(placeholder, text: text!)
                            .modifier(GATextFieldModifier(focused, focusedState))

                        if isFocused {
                            Button("", systemImage: "xmark", action: {
                                if onRemoveText != nil { onRemoveText!() }
                            })
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .offset(x: 18)
                        }
                    }
                }

                if numberValue != nil {
                    TextField(placeholder, value: numberValue!, format: .number)
                        .modifier(GATextFieldModifier(focused, focusedState, true))

                    Text("Points").gaTypography(.footnote2)
                }
            }
            .modifier(GATextFieldStyleModifier(isFocused, hasError: hasError))
            .modifier(GAShakeAnimation(hasError: hasError))

            if hasError {
                Text(errorMessage ?? "").gaTypography(.body1)
                    .padding(.top, 8)
                    .padding(.leading, 34)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .transition(.move(edge: .top))
                    .animation(.easeInOut(duration: gaAppState.animationDefaultDuration / 4), value: hasError)
            }
        }
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
    var hasError: Bool

    init(_ isFocused: Bool, hasError: Bool? = nil) {
        self.isFocused = isFocused
        self.hasError = hasError ?? false
    }

    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 32)
            .padding(.vertical, 12)
            .background(
                Capsule()
                    .fill(isFocused ? .clear : .grey1)
                    .if(isFocused || hasError) { content in
                        if hasError {
                            content.stroke(.red, lineWidth: 2)
                        } else if isFocused, !hasError {
                            content.stroke(.yellow1, lineWidth: 1)
                        } else {
                            content.stroke(.clear, lineWidth: 1)
                        }
                    }
                    .animation(.linear(duration: gaAppState.animationDefaultDuration / 2), value: isFocused)
            )
            .contentShape(Capsule())
    }
}

private struct GAShakeAnimation: ViewModifier {
    var hasError: Bool

    func body(content: Content) -> some View {
        content
            .transformEffect(CGAffineTransform(translationX: hasError ? -4 : 4, y: 0))
            .offset(x: hasError ? 4 : -4, y: 0)
            .animation(
                hasError
                    ? .easeInOut(duration: 0.04).repeatCount(6, autoreverses: false)
                    : .easeInOut(duration: 0.04),
                value: hasError
            )
    }
}

private struct GATextFieldPreview: View {
    enum FocusedFields: Hashable {
        case title
        case error
        case reward
    }

    @FocusState var focusedState: FocusedFields?
    @State var text = ""
    @State var error = ""
    @State var num: Int?
    @State var errorMessage: String?

    var body: some View {
        VStack {
            GATextField<FocusedFields>(
                placeholder: "title", focused: .title, focusedState: $focusedState, isFocused: focusedState == .title, text: $text, onRemoveText: { text = "" }
            )
            .onTapGesture { withAnimation { focusedState = .title }}

            GATextField<FocusedFields>(
                placeholder: "error", focused: .error, focusedState: $focusedState, isFocused: focusedState == .error, errorMessage: errorMessage, text: $error, onRemoveText: { error = ""; errorMessage = "" }
            )
            .onTapGesture {
                withAnimation { focusedState = .error }
            }

            GATextField<FocusedFields>(
                placeholder: "0", focused: .reward, focusedState: $focusedState, isFocused: focusedState == .reward, numberValue: $num
            )
            .onTapGesture { withAnimation { focusedState = .reward } }

            Button(action: {
                withAnimation {
                    errorMessage = "error message"
                }
            }, label: {
                Text("Show error")
            })
        }
        .padding()
    }
}

#Preview {
    GATextFieldPreview()
        .environmentObject(GAAppState())
}
