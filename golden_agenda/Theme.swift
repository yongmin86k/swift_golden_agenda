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

struct MyFont: ViewModifier {
        public enum TextStyle {
        case title
        case body
        case label
    }

    var textStyle: TextStyle

    func body(content: Content) -> some View {
        let scaledSize = UIFontMetrics.default.scaledValue(for: size)
        
        return content.font(.system(size: scaledSize, weight: .semibold))
    }

    private var size: CGFloat {
        switch textStyle {
        case .title:
            return 26
        case .body:
            return 16
        case .label:
            return 12
        }
    }
}
