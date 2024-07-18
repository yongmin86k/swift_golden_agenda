//
//  GABorderView.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-07-17.
//  Ref: https://www.swiftbysundell.com/tips/creating-custom-swiftui-container-views/

import SwiftUI

struct GABorderView<Content: View>: View {
    var content: () -> Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    var body: some View {
        content()
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(
                        LinearGradient(
                            gradient: Gradient(colors: [.grey2.opacity(0), .grey2]),
                            startPoint: .top,
                            endPoint: .bottom
                        ), lineWidth: 1
                    )
            )
    }
}

#Preview {
    GABorderView {
        Text("hello world")
    }
}
