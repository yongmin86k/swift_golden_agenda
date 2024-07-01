//
//  GATagView.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-06-24.
//

import SwiftUI

struct GATagView: View {
    var text: String
    var borderColor: Color = .grey2
    var textColor: Color = .grey2

    var body: some View {
        Text(text)
            .gaTypography(.footnote2)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .foregroundColor(textColor)
            .overlay(
                Capsule(style: .continuous)
                    .stroke(borderColor, style: StrokeStyle(lineWidth: 1))
                    .frame(minWidth: 36, minHeight: 24)
            )
    }
}

#Preview {
    GATagView(text: "2024")
}
