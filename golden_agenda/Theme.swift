//
//  Theme.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-06-23.
//

import UIKit

enum AssetsColor : String {
    case yellow1
    case yellow2
    case grey1
    case grey2
    case whiteOp30
}

extension UIColor {
    static func appColor(_ name: AssetsColor) -> UIColor? {
        let colorName = name.rawValue
        return UIColor(named: colorName)
    }
}
