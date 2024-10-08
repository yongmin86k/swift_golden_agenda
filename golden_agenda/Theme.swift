//
//  Theme.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-06-23.
//  Ref: https://medium.com/@drevathy/custom-themes-with-color-assets-in-swift-9e64f91ee45d
//  Ref: https://www.hackingwithswift.com/quick-start/swiftui/how-to-use-dynamic-type-with-a-custom-font

import SwiftUI
import UIKit

enum AssetsColor: String {
    case black1
    case grey1
    case grey2
    case whiteOp30
    case yellow1
    case yellow2
}

extension UIColor {
    static func appColor(_ name: AssetsColor) -> UIColor? {
        let colorName = name.rawValue
        return UIColor(named: colorName)
    }
}

private struct GABackgroundViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        ZStack(
            alignment: Alignment(horizontal: .center, vertical: .top),
            content: {
                Color.grey1.ignoresSafeArea()

                content
            })
            .foregroundColor(.black1)
            .edgesIgnoringSafeArea(.bottom)
    }
}

extension View {
    func GABackground() -> some View {
        modifier(GABackgroundViewModifier())
    }
}

struct GAFont: ViewModifier {
    @Environment(\.sizeCategory) var sizeCategory

    public enum TextStyle {
        case title1
        case title2
        case input1
        case body1
        case footnote1
        case footnote2
    }

    var textStyle: TextStyle

    private var size: CGFloat {
        switch textStyle {
        case .title1:
            return 28
        case .title2:
            return 20
        case .input1:
            return 18
        case .body1:
            return 16
        case .footnote1:
            return 14
        case .footnote2:
            return 12
        }
    }

    private var weight: Font.Weight {
        switch textStyle {
        case .title2, .footnote1:
            return .semibold
        case .title1, .input1, .body1:
            return .regular
        case .footnote2:
            return .bold
        }
    }

    func body(content: Content) -> some View {
        let scaledSize = UIFontMetrics.default.scaledValue(for: size)

        return content.font(.system(size: scaledSize, weight: weight, design: .default))
    }
}

extension View {
    func gaTypography(_ textStyle: GAFont.TextStyle) -> some View {
        modifier(GAFont(textStyle: textStyle))
    }
}

private struct GAShadowStyleModifier1: ViewModifier {
    func body(content: Content) -> some View {
        content.shadow(color: .black1.opacity(0.2), radius: 8, y: 2)
    }
}

extension View {
    func gaShadowStyle1() -> some View {
        modifier(GAShadowStyleModifier1())
    }
}

struct GAToggleStyle: ToggleStyle {
    var shape: GAShapes

    func makeBody(configuration: Configuration) -> some View {
        HStack {
            createGAShape(shape)
                .frame(width: 24, height: 24)
                .foregroundColor(.black1)

            configuration.label
                .gaTypography(.body1).fontWeight(.bold)

            Spacer()

            Capsule()
                .fill(configuration.isOn
                    ? LinearGradient(
                        gradient: Gradient(colors: [.yellow1, .yellow2]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    : LinearGradient(
                        gradient: Gradient(colors: [.grey2, .grey2]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .gaShadowStyle1()
                .frame(width: 52, height: 28)
                .overlay(
                    Circle()
                        .fill(Color.white)
                        .padding(3)
                        .offset(x: configuration.isOn ? 12 : -12)
                )
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.1)) {
                        configuration.isOn.toggle()
                    }
                }
        }
    }
}
