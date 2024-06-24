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

    @State var sizeOfTag: CGSize = .init(width: 32, height: 22)

    var body: some View {
        let radius = CGFloat(sizeOfTag.height / 2)

        Text(text)
            .font(.system(.caption, weight: .bold))
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .frame(minWidth: sizeOfTag.width, minHeight: sizeOfTag.height)
            .foregroundColor(textColor)
            .cornerRadius(radius, antialiased: true)
            .overlay(
                GeometryReader { proxy in
                    RoundedRectangle(cornerRadius: radius)
                        .inset(by: 1)
                        .strokeBorder(borderColor, lineWidth: 1, antialiased: true)
                        .onAppear {
                            self.sizeOfTag = proxy.size
                        }
                }
            )
    }
}

#Preview {
    GATagView(text: "hello")
}
