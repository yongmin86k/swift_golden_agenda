//
//  GADottedView.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-07-07.
//

import SwiftUI

enum GADottedViewType {
    case rounded
    case uneven
}

private struct DottedShapeView<ShapeContent: InsettableShape>: View {
    let shapeContent: () -> ShapeContent

    var body: some View {
        return shapeContent()
            .strokeBorder(
                style: StrokeStyle(
                    lineWidth: 1,
                    lineCap: .round,
                    lineJoin: .round,
                    dash: [4, 12],
                    dashPhase: 28.96
                )
            )
            .foregroundColor(.grey2)
    }
}

struct GADottedView: View {
    var type: GADottedViewType

    init(_ type: GADottedViewType? = .rounded) {
        self.type = type ?? .rounded
    }

    var body: some View {
        if type == .rounded {
            DottedShapeView(shapeContent: {
                RoundedRectangle(cornerRadius: 16)
            })
        } else {
            DottedShapeView(shapeContent: {
                UnevenRoundedRectangle(cornerRadii: .init(
                    topLeading: 16, bottomLeading: 0, bottomTrailing: 0, topTrailing: 16
                ))
            })
        }
    }
}

#Preview {
    GADottedView()
        .frame(width: 300, height: 200)
}
