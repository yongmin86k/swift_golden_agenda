//
//  AgendaWheel.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-06-24.
//

import SwiftUI

struct AgendaWheel: View {
    @EnvironmentObject private var gaAppState: GAAppState

    @State private var wheelSize: CGSize = .zero

    var body: some View {
        GeometryReader { proxy in
            let drawableSize = proxy.size
            let diameter = min(proxy.size.width, proxy.size.height) * 1.5

            ZStack(
                alignment: Alignment(horizontal: .center, vertical: .center),
                content: {
                    Circle()
                        .stroke(.grey2, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                        .frame(width: diameter, height: diameter)

                    Days(diameter: diameter)
                }
            )
            .frame(width: drawableSize.width, height: drawableSize.height)
        }
    }

    @ViewBuilder
    func Dot(d: CGFloat, c: Color) -> some View {
        Circle()
            .fill(c)
            .frame(width: d, height: d)
    }

    @ViewBuilder
    func Days(diameter: CGFloat) -> some View {
        let selectedDateIndex = gaAppState.selectedDateIndex

        ForEach(gaAppState.dateInWheel, id: \.self) { date in
            let index = gaAppState.getDateItemIndex(date: date)
            let isCurrent = selectedDateIndex == index

            let calendar = Calendar.current
            let day = String(calendar.component(.day, from: date))

            let color = Color(isCurrent ? .black1 : .grey2)
            let fontSize = CGFloat(isCurrent ? 36 : 20)
            let dotSize = CGFloat(isCurrent ? 12 : 6)
            let padding = CGFloat(4)

            let offsetPositionY = -CGFloat(fontSize + dotSize + padding + 1)

            VStack(
                alignment: .center,
                spacing: 0,
                content: {
                    Text("\(day)")
                        .font(
                            .system(size: fontSize, weight: .regular, design: .default)
                        )
                        .foregroundStyle(color)
                        .padding(.bottom, padding)
                        .transaction { transaction in
                            // Ref: https://www.avanderlee.com/swiftui/disable-animations-transactions/
                            transaction.animation = nil
                        }

                    Dot(d: dotSize, c: color)

                    Spacer()
                }
            )
            .frame(height: diameter)
            .offset(y: offsetPositionY)
            .rotationEffect(gaAppState.getDateItemDegree(date: date))
        }
    }
}

#Preview {
    AgendaWheel().environmentObject(GAAppState())
}
