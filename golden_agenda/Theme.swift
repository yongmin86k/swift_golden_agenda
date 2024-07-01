//
//  Theme.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-06-23.
//

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
        case body
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
        case .body:
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
        case .title1, .body:
            return .regular
        case .footnote2:
            return .bold
        }
    }

    func body(content: Content) -> some View {
        let scaledSize = UIFontMetrics.default.scaledValue(for: size)

        return content.font(.system(size: scaledSize, weight: weight))
    }
}

extension View {
    func gaTypography(_ textStyle: GAFont.TextStyle) -> some View {
        modifier(GAFont(textStyle: textStyle))
    }
}
