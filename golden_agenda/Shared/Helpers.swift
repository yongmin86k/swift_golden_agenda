//
//  Helpers.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-07-28.
//

import SwiftUI

class Helpers {
    @available(*, unavailable) private init() {}
    
    static func naturalCGFloat(_ num: CGFloat, maximum: CGFloat? = 0) -> CGFloat {
        
        return CGFloat(Int(max(num, maximum ?? 0)))
    }
}
