//
//  GAShapes.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-06-23.
//

import Foundation
import SwiftUI

enum GAShapes {
    case chartTimelineVariantShimmer
    case checkboxMarkedCirclePlusOutline
    case cog
    case cogOutline
    case formatListChecks
    case gift
    case giftOutline
    case plusThick
}


@ViewBuilder  func createTogShape(type: GAShapes) -> some View {
    switch(type) {
    case .chartTimelineVariantShimmer:
        ChartTimelineVariantShimmerShape()
    case .checkboxMarkedCirclePlusOutline:
        CheckboxMarkedCirclePlusOutlineShape()
    case .cog:
        CogShape()
    case .cogOutline:
        CogOutlineShape()
    case .formatListChecks:
        FormatListChecksShape()
    case .gift:
        GiftShape()
    case .giftOutline:
        GiftOutlineShape()
    case .plusThick:
        PlusThickShape()
    }
}

private struct ChartTimelineVariantShimmerShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.875*width, y: 0.35429*height))
        path.addCurve(to: CGPoint(x: 0.79583*width, y: 0.45846*height), control1: CGPoint(x: 0.8125*width, y: 0.35429*height), control2: CGPoint(x: 0.77917*width, y: 0.41263*height))
        path.addLine(to: CGPoint(x: 0.64583*width, y: 0.60846*height))
        path.addCurve(to: CGPoint(x: 0.60417*width, y: 0.60846*height), control1: CGPoint(x: 0.63333*width, y: 0.6043*height), control2: CGPoint(x: 0.61667*width, y: 0.6043*height))
        path.addLine(to: CGPoint(x: 0.49583*width, y: 0.50013*height))
        path.addCurve(to: CGPoint(x: 0.41667*width, y: 0.39596*height), control1: CGPoint(x: 0.5125*width, y: 0.4543*height), control2: CGPoint(x: 0.47917*width, y: 0.39596*height))
        path.addCurve(to: CGPoint(x: 0.3375*width, y: 0.50013*height), control1: CGPoint(x: 0.35833*width, y: 0.39596*height), control2: CGPoint(x: 0.32083*width, y: 0.4543*height))
        path.addLine(to: CGPoint(x: 0.14583*width, y: 0.68763*height))
        path.addCurve(to: CGPoint(x: 0.04167*width, y: 0.77096*height), control1: CGPoint(x: 0.1*width, y: 0.67513*height), control2: CGPoint(x: 0.04167*width, y: 0.70846*height))
        path.addCurve(to: CGPoint(x: 0.125*width, y: 0.8543*height), control1: CGPoint(x: 0.04167*width, y: 0.8168*height), control2: CGPoint(x: 0.07917*width, y: 0.8543*height))
        path.addCurve(to: CGPoint(x: 0.20417*width, y: 0.75013*height), control1: CGPoint(x: 0.18333*width, y: 0.8543*height), control2: CGPoint(x: 0.22083*width, y: 0.79596*height))
        path.addLine(to: CGPoint(x: 0.39167*width, y: 0.55846*height))
        path.addCurve(to: CGPoint(x: 0.43333*width, y: 0.55846*height), control1: CGPoint(x: 0.40417*width, y: 0.56263*height), control2: CGPoint(x: 0.42083*width, y: 0.56263*height))
        path.addLine(to: CGPoint(x: 0.54167*width, y: 0.6668*height))
        path.addCurve(to: CGPoint(x: 0.625*width, y: 0.77096*height), control1: CGPoint(x: 0.52917*width, y: 0.70846*height), control2: CGPoint(x: 0.5625*width, y: 0.77096*height))
        path.addCurve(to: CGPoint(x: 0.70417*width, y: 0.6668*height), control1: CGPoint(x: 0.6875*width, y: 0.77096*height), control2: CGPoint(x: 0.72083*width, y: 0.71263*height))
        path.addLine(to: CGPoint(x: 0.85417*width, y: 0.5168*height))
        path.addCurve(to: CGPoint(x: 0.95833*width, y: 0.43763*height), control1: CGPoint(x: 0.9*width, y: 0.5293*height), control2: CGPoint(x: 0.95833*width, y: 0.49596*height))
        path.addCurve(to: CGPoint(x: 0.875*width, y: 0.35429*height), control1: CGPoint(x: 0.95833*width, y: 0.39179*height), control2: CGPoint(x: 0.92083*width, y: 0.35429*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.625*width, y: 0.39596*height))
        path.addLine(to: CGPoint(x: 0.6625*width, y: 0.30846*height))
        path.addLine(to: CGPoint(x: 0.75*width, y: 0.27096*height))
        path.addLine(to: CGPoint(x: 0.6625*width, y: 0.23346*height))
        path.addLine(to: CGPoint(x: 0.625*width, y: 0.14596*height))
        path.addLine(to: CGPoint(x: 0.5875*width, y: 0.23346*height))
        path.addLine(to: CGPoint(x: 0.5*width, y: 0.27096*height))
        path.addLine(to: CGPoint(x: 0.5875*width, y: 0.30846*height))
        path.addLine(to: CGPoint(x: 0.625*width, y: 0.39596*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.14583*width, y: 0.4793*height))
        path.addLine(to: CGPoint(x: 0.16667*width, y: 0.39596*height))
        path.addLine(to: CGPoint(x: 0.25*width, y: 0.37513*height))
        path.addLine(to: CGPoint(x: 0.16667*width, y: 0.35429*height))
        path.addLine(to: CGPoint(x: 0.14583*width, y: 0.27096*height))
        path.addLine(to: CGPoint(x: 0.125*width, y: 0.35429*height))
        path.addLine(to: CGPoint(x: 0.04167*width, y: 0.37513*height))
        path.addLine(to: CGPoint(x: 0.125*width, y: 0.39596*height))
        path.addLine(to: CGPoint(x: 0.14583*width, y: 0.4793*height))
        path.closeSubpath()
        return path
    }
}

private struct CheckboxMarkedCirclePlusOutlineShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.59583*width, y: 0.92513*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0.93763*height), control1: CGPoint(x: 0.56667*width, y: 0.93346*height), control2: CGPoint(x: 0.53333*width, y: 0.93763*height))
        path.addCurve(to: CGPoint(x: 0.08333*width, y: 0.52096*height), control1: CGPoint(x: 0.27083*width, y: 0.93763*height), control2: CGPoint(x: 0.08333*width, y: 0.75013*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0.10429*height), control1: CGPoint(x: 0.08333*width, y: 0.29179*height), control2: CGPoint(x: 0.27083*width, y: 0.10429*height))
        path.addCurve(to: CGPoint(x: 0.65833*width, y: 0.13346*height), control1: CGPoint(x: 0.55417*width, y: 0.10429*height), control2: CGPoint(x: 0.60833*width, y: 0.11679*height))
        path.addLine(to: CGPoint(x: 0.59167*width, y: 0.20013*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0.18763*height), control1: CGPoint(x: 0.5625*width, y: 0.19179*height), control2: CGPoint(x: 0.53333*width, y: 0.18763*height))
        path.addCurve(to: CGPoint(x: 0.16667*width, y: 0.52096*height), control1: CGPoint(x: 0.31667*width, y: 0.18763*height), control2: CGPoint(x: 0.16667*width, y: 0.33763*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0.8543*height), control1: CGPoint(x: 0.16667*width, y: 0.7043*height), control2: CGPoint(x: 0.31667*width, y: 0.8543*height))
        path.addCurve(to: CGPoint(x: 0.55417*width, y: 0.85013*height), control1: CGPoint(x: 0.51667*width, y: 0.8543*height), control2: CGPoint(x: 0.5375*width, y: 0.8543*height))
        path.addCurve(to: CGPoint(x: 0.59583*width, y: 0.92513*height), control1: CGPoint(x: 0.5625*width, y: 0.8793*height), control2: CGPoint(x: 0.57917*width, y: 0.9043*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.32917*width, y: 0.4418*height))
        path.addLine(to: CGPoint(x: 0.27083*width, y: 0.50013*height))
        path.addLine(to: CGPoint(x: 0.45833*width, y: 0.68763*height))
        path.addLine(to: CGPoint(x: 0.875*width, y: 0.27096*height))
        path.addLine(to: CGPoint(x: 0.81667*width, y: 0.21263*height))
        path.addLine(to: CGPoint(x: 0.45833*width, y: 0.57096*height))
        path.addLine(to: CGPoint(x: 0.32917*width, y: 0.4418*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.75*width, y: 0.6043*height))
        path.addLine(to: CGPoint(x: 0.75*width, y: 0.7293*height))
        path.addLine(to: CGPoint(x: 0.625*width, y: 0.7293*height))
        path.addLine(to: CGPoint(x: 0.625*width, y: 0.81263*height))
        path.addLine(to: CGPoint(x: 0.75*width, y: 0.81263*height))
        path.addLine(to: CGPoint(x: 0.75*width, y: 0.93763*height))
        path.addLine(to: CGPoint(x: 0.83333*width, y: 0.93763*height))
        path.addLine(to: CGPoint(x: 0.83333*width, y: 0.81263*height))
        path.addLine(to: CGPoint(x: 0.95833*width, y: 0.81263*height))
        path.addLine(to: CGPoint(x: 0.95833*width, y: 0.7293*height))
        path.addLine(to: CGPoint(x: 0.83333*width, y: 0.7293*height))
        path.addLine(to: CGPoint(x: 0.83333*width, y: 0.6043*height))
        path.addLine(to: CGPoint(x: 0.75*width, y: 0.6043*height))
        path.closeSubpath()
        return path
    }
}

private struct CogShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.5*width, y: 0.64583*height))
        path.addCurve(to: CGPoint(x: 0.39688*width, y: 0.60312*height), control1: CGPoint(x: 0.46132*width, y: 0.64583*height), control2: CGPoint(x: 0.42423*width, y: 0.63047*height))
        path.addCurve(to: CGPoint(x: 0.35417*width, y: 0.5*height), control1: CGPoint(x: 0.36953*width, y: 0.57577*height), control2: CGPoint(x: 0.35417*width, y: 0.53868*height))
        path.addCurve(to: CGPoint(x: 0.39688*width, y: 0.39688*height), control1: CGPoint(x: 0.35417*width, y: 0.46132*height), control2: CGPoint(x: 0.36953*width, y: 0.42423*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0.35417*height), control1: CGPoint(x: 0.42423*width, y: 0.36953*height), control2: CGPoint(x: 0.46132*width, y: 0.35417*height))
        path.addCurve(to: CGPoint(x: 0.60312*width, y: 0.39688*height), control1: CGPoint(x: 0.53868*width, y: 0.35417*height), control2: CGPoint(x: 0.57577*width, y: 0.36953*height))
        path.addCurve(to: CGPoint(x: 0.64583*width, y: 0.5*height), control1: CGPoint(x: 0.63047*width, y: 0.42423*height), control2: CGPoint(x: 0.64583*width, y: 0.46132*height))
        path.addCurve(to: CGPoint(x: 0.60312*width, y: 0.60312*height), control1: CGPoint(x: 0.64583*width, y: 0.53868*height), control2: CGPoint(x: 0.63047*width, y: 0.57577*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0.64583*height), control1: CGPoint(x: 0.57577*width, y: 0.63047*height), control2: CGPoint(x: 0.53868*width, y: 0.64583*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.80958*width, y: 0.54042*height))
        path.addCurve(to: CGPoint(x: 0.8125*width, y: 0.5*height), control1: CGPoint(x: 0.81125*width, y: 0.52708*height), control2: CGPoint(x: 0.8125*width, y: 0.51375*height))
        path.addCurve(to: CGPoint(x: 0.80958*width, y: 0.45833*height), control1: CGPoint(x: 0.8125*width, y: 0.48625*height), control2: CGPoint(x: 0.81125*width, y: 0.4725*height))
        path.addLine(to: CGPoint(x: 0.8975*width, y: 0.39042*height))
        path.addCurve(to: CGPoint(x: 0.9025*width, y: 0.36375*height), control1: CGPoint(x: 0.90542*width, y: 0.38417*height), control2: CGPoint(x: 0.9075*width, y: 0.37292*height))
        path.addLine(to: CGPoint(x: 0.81917*width, y: 0.21958*height))
        path.addCurve(to: CGPoint(x: 0.79375*width, y: 0.21042*height), control1: CGPoint(x: 0.81417*width, y: 0.21042*height), control2: CGPoint(x: 0.80292*width, y: 0.20667*height))
        path.addLine(to: CGPoint(x: 0.69*width, y: 0.25208*height))
        path.addCurve(to: CGPoint(x: 0.61958*width, y: 0.21125*height), control1: CGPoint(x: 0.66833*width, y: 0.23583*height), control2: CGPoint(x: 0.64583*width, y: 0.22167*height))
        path.addLine(to: CGPoint(x: 0.60417*width, y: 0.10083*height))
        path.addCurve(to: CGPoint(x: 0.58333*width, y: 0.08333*height), control1: CGPoint(x: 0.6025*width, y: 0.09083*height), control2: CGPoint(x: 0.59375*width, y: 0.08333*height))
        path.addLine(to: CGPoint(x: 0.41667*width, y: 0.08333*height))
        path.addCurve(to: CGPoint(x: 0.39583*width, y: 0.10083*height), control1: CGPoint(x: 0.40625*width, y: 0.08333*height), control2: CGPoint(x: 0.3975*width, y: 0.09083*height))
        path.addLine(to: CGPoint(x: 0.38042*width, y: 0.21125*height))
        path.addCurve(to: CGPoint(x: 0.31*width, y: 0.25208*height), control1: CGPoint(x: 0.35417*width, y: 0.22167*height), control2: CGPoint(x: 0.33167*width, y: 0.23583*height))
        path.addLine(to: CGPoint(x: 0.20625*width, y: 0.21042*height))
        path.addCurve(to: CGPoint(x: 0.18083*width, y: 0.21958*height), control1: CGPoint(x: 0.19708*width, y: 0.20667*height), control2: CGPoint(x: 0.18583*width, y: 0.21042*height))
        path.addLine(to: CGPoint(x: 0.0975*width, y: 0.36375*height))
        path.addCurve(to: CGPoint(x: 0.1025*width, y: 0.39042*height), control1: CGPoint(x: 0.09208*width, y: 0.37292*height), control2: CGPoint(x: 0.09458*width, y: 0.38417*height))
        path.addLine(to: CGPoint(x: 0.19042*width, y: 0.45833*height))
        path.addCurve(to: CGPoint(x: 0.1875*width, y: 0.5*height), control1: CGPoint(x: 0.18875*width, y: 0.4725*height), control2: CGPoint(x: 0.1875*width, y: 0.48625*height))
        path.addCurve(to: CGPoint(x: 0.19042*width, y: 0.54042*height), control1: CGPoint(x: 0.1875*width, y: 0.51375*height), control2: CGPoint(x: 0.18875*width, y: 0.52708*height))
        path.addLine(to: CGPoint(x: 0.1025*width, y: 0.60958*height))
        path.addCurve(to: CGPoint(x: 0.0975*width, y: 0.63625*height), control1: CGPoint(x: 0.09458*width, y: 0.61583*height), control2: CGPoint(x: 0.09208*width, y: 0.62708*height))
        path.addLine(to: CGPoint(x: 0.18083*width, y: 0.78042*height))
        path.addCurve(to: CGPoint(x: 0.20625*width, y: 0.78958*height), control1: CGPoint(x: 0.18583*width, y: 0.78958*height), control2: CGPoint(x: 0.19708*width, y: 0.79292*height))
        path.addLine(to: CGPoint(x: 0.31*width, y: 0.7475*height))
        path.addCurve(to: CGPoint(x: 0.38042*width, y: 0.78875*height), control1: CGPoint(x: 0.33167*width, y: 0.76417*height), control2: CGPoint(x: 0.35417*width, y: 0.77833*height))
        path.addLine(to: CGPoint(x: 0.39583*width, y: 0.89917*height))
        path.addCurve(to: CGPoint(x: 0.41667*width, y: 0.91667*height), control1: CGPoint(x: 0.3975*width, y: 0.90917*height), control2: CGPoint(x: 0.40625*width, y: 0.91667*height))
        path.addLine(to: CGPoint(x: 0.58333*width, y: 0.91667*height))
        path.addCurve(to: CGPoint(x: 0.60417*width, y: 0.89917*height), control1: CGPoint(x: 0.59375*width, y: 0.91667*height), control2: CGPoint(x: 0.6025*width, y: 0.90917*height))
        path.addLine(to: CGPoint(x: 0.61958*width, y: 0.78875*height))
        path.addCurve(to: CGPoint(x: 0.69*width, y: 0.7475*height), control1: CGPoint(x: 0.64583*width, y: 0.77792*height), control2: CGPoint(x: 0.66833*width, y: 0.76417*height))
        path.addLine(to: CGPoint(x: 0.79375*width, y: 0.78958*height))
        path.addCurve(to: CGPoint(x: 0.81917*width, y: 0.78042*height), control1: CGPoint(x: 0.80292*width, y: 0.79292*height), control2: CGPoint(x: 0.81417*width, y: 0.78958*height))
        path.addLine(to: CGPoint(x: 0.9025*width, y: 0.63625*height))
        path.addCurve(to: CGPoint(x: 0.8975*width, y: 0.60958*height), control1: CGPoint(x: 0.9075*width, y: 0.62708*height), control2: CGPoint(x: 0.90542*width, y: 0.61583*height))
        path.addLine(to: CGPoint(x: 0.80958*width, y: 0.54042*height))
        path.closeSubpath()
        return path
    }
}

private struct CogOutlineShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.5*width, y: 0.34012*height))
        path.addCurve(to: CGPoint(x: 0.61785*width, y: 0.38698*height), control1: CGPoint(x: 0.5442*width, y: 0.34012*height), control2: CGPoint(x: 0.5866*width, y: 0.35698*height))
        path.addCurve(to: CGPoint(x: 0.66667*width, y: 0.50012*height), control1: CGPoint(x: 0.64911*width, y: 0.41699*height), control2: CGPoint(x: 0.66667*width, y: 0.45769*height))
        path.addCurve(to: CGPoint(x: 0.61785*width, y: 0.61326*height), control1: CGPoint(x: 0.66667*width, y: 0.54256*height), control2: CGPoint(x: 0.64911*width, y: 0.58325*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0.66012*height), control1: CGPoint(x: 0.5866*width, y: 0.64326*height), control2: CGPoint(x: 0.5442*width, y: 0.66012*height))
        path.addCurve(to: CGPoint(x: 0.38215*width, y: 0.61326*height), control1: CGPoint(x: 0.4558*width, y: 0.66012*height), control2: CGPoint(x: 0.4134*width, y: 0.64326*height))
        path.addCurve(to: CGPoint(x: 0.33333*width, y: 0.50012*height), control1: CGPoint(x: 0.35089*width, y: 0.58325*height), control2: CGPoint(x: 0.33333*width, y: 0.54256*height))
        path.addCurve(to: CGPoint(x: 0.38215*width, y: 0.38698*height), control1: CGPoint(x: 0.33333*width, y: 0.45769*height), control2: CGPoint(x: 0.35089*width, y: 0.41699*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0.34012*height), control1: CGPoint(x: 0.4134*width, y: 0.35698*height), control2: CGPoint(x: 0.4558*width, y: 0.34012*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.5*width, y: 0.42012*height))
        path.addCurve(to: CGPoint(x: 0.44108*width, y: 0.44355*height), control1: CGPoint(x: 0.4779*width, y: 0.42012*height), control2: CGPoint(x: 0.4567*width, y: 0.42855*height))
        path.addCurve(to: CGPoint(x: 0.41667*width, y: 0.50012*height), control1: CGPoint(x: 0.42545*width, y: 0.45856*height), control2: CGPoint(x: 0.41667*width, y: 0.4789*height))
        path.addCurve(to: CGPoint(x: 0.44108*width, y: 0.55669*height), control1: CGPoint(x: 0.41667*width, y: 0.52134*height), control2: CGPoint(x: 0.42545*width, y: 0.54169*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0.58012*height), control1: CGPoint(x: 0.4567*width, y: 0.57169*height), control2: CGPoint(x: 0.4779*width, y: 0.58012*height))
        path.addCurve(to: CGPoint(x: 0.55893*width, y: 0.55669*height), control1: CGPoint(x: 0.5221*width, y: 0.58012*height), control2: CGPoint(x: 0.5433*width, y: 0.57169*height))
        path.addCurve(to: CGPoint(x: 0.58333*width, y: 0.50012*height), control1: CGPoint(x: 0.57455*width, y: 0.54169*height), control2: CGPoint(x: 0.58333*width, y: 0.52134*height))
        path.addCurve(to: CGPoint(x: 0.55893*width, y: 0.44355*height), control1: CGPoint(x: 0.58333*width, y: 0.4789*height), control2: CGPoint(x: 0.57455*width, y: 0.45856*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0.42012*height), control1: CGPoint(x: 0.5433*width, y: 0.42855*height), control2: CGPoint(x: 0.5221*width, y: 0.42012*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.41667*width, y: 0.90012*height))
        path.addCurve(to: CGPoint(x: 0.39583*width, y: 0.88332*height), control1: CGPoint(x: 0.40625*width, y: 0.90012*height), control2: CGPoint(x: 0.3975*width, y: 0.89292*height))
        path.addLine(to: CGPoint(x: 0.38042*width, y: 0.77732*height))
        path.addCurve(to: CGPoint(x: 0.31*width, y: 0.73772*height), control1: CGPoint(x: 0.35417*width, y: 0.76732*height), control2: CGPoint(x: 0.33167*width, y: 0.75372*height))
        path.addLine(to: CGPoint(x: 0.20625*width, y: 0.77812*height))
        path.addCurve(to: CGPoint(x: 0.18083*width, y: 0.76932*height), control1: CGPoint(x: 0.19708*width, y: 0.78132*height), control2: CGPoint(x: 0.18583*width, y: 0.77812*height))
        path.addLine(to: CGPoint(x: 0.0975*width, y: 0.63092*height))
        path.addCurve(to: CGPoint(x: 0.1025*width, y: 0.60532*height), control1: CGPoint(x: 0.09208*width, y: 0.62212*height), control2: CGPoint(x: 0.09458*width, y: 0.61132*height))
        path.addLine(to: CGPoint(x: 0.19042*width, y: 0.53892*height))
        path.addLine(to: CGPoint(x: 0.1875*width, y: 0.50012*height))
        path.addLine(to: CGPoint(x: 0.19042*width, y: 0.46012*height))
        path.addLine(to: CGPoint(x: 0.1025*width, y: 0.39492*height))
        path.addCurve(to: CGPoint(x: 0.0975*width, y: 0.36932*height), control1: CGPoint(x: 0.09458*width, y: 0.38892*height), control2: CGPoint(x: 0.09208*width, y: 0.37812*height))
        path.addLine(to: CGPoint(x: 0.18083*width, y: 0.23092*height))
        path.addCurve(to: CGPoint(x: 0.20625*width, y: 0.22212*height), control1: CGPoint(x: 0.18583*width, y: 0.22212*height), control2: CGPoint(x: 0.19708*width, y: 0.21852*height))
        path.addLine(to: CGPoint(x: 0.31*width, y: 0.26212*height))
        path.addCurve(to: CGPoint(x: 0.38042*width, y: 0.22292*height), control1: CGPoint(x: 0.33167*width, y: 0.24652*height), control2: CGPoint(x: 0.35417*width, y: 0.23292*height))
        path.addLine(to: CGPoint(x: 0.39583*width, y: 0.11692*height))
        path.addCurve(to: CGPoint(x: 0.41667*width, y: 0.10012*height), control1: CGPoint(x: 0.3975*width, y: 0.10732*height), control2: CGPoint(x: 0.40625*width, y: 0.10012*height))
        path.addLine(to: CGPoint(x: 0.58333*width, y: 0.10012*height))
        path.addCurve(to: CGPoint(x: 0.60417*width, y: 0.11692*height), control1: CGPoint(x: 0.59375*width, y: 0.10012*height), control2: CGPoint(x: 0.6025*width, y: 0.10732*height))
        path.addLine(to: CGPoint(x: 0.61958*width, y: 0.22292*height))
        path.addCurve(to: CGPoint(x: 0.69*width, y: 0.26212*height), control1: CGPoint(x: 0.64583*width, y: 0.23292*height), control2: CGPoint(x: 0.66833*width, y: 0.24652*height))
        path.addLine(to: CGPoint(x: 0.79375*width, y: 0.22212*height))
        path.addCurve(to: CGPoint(x: 0.81917*width, y: 0.23092*height), control1: CGPoint(x: 0.80292*width, y: 0.21852*height), control2: CGPoint(x: 0.81417*width, y: 0.22212*height))
        path.addLine(to: CGPoint(x: 0.9025*width, y: 0.36932*height))
        path.addCurve(to: CGPoint(x: 0.8975*width, y: 0.39492*height), control1: CGPoint(x: 0.90792*width, y: 0.37812*height), control2: CGPoint(x: 0.90542*width, y: 0.38892*height))
        path.addLine(to: CGPoint(x: 0.80958*width, y: 0.46012*height))
        path.addLine(to: CGPoint(x: 0.8125*width, y: 0.50012*height))
        path.addLine(to: CGPoint(x: 0.80958*width, y: 0.54012*height))
        path.addLine(to: CGPoint(x: 0.8975*width, y: 0.60532*height))
        path.addCurve(to: CGPoint(x: 0.9025*width, y: 0.63092*height), control1: CGPoint(x: 0.90542*width, y: 0.61132*height), control2: CGPoint(x: 0.90792*width, y: 0.62212*height))
        path.addLine(to: CGPoint(x: 0.81917*width, y: 0.76932*height))
        path.addCurve(to: CGPoint(x: 0.79375*width, y: 0.77812*height), control1: CGPoint(x: 0.81417*width, y: 0.77812*height), control2: CGPoint(x: 0.80292*width, y: 0.78172*height))
        path.addLine(to: CGPoint(x: 0.69*width, y: 0.73812*height))
        path.addCurve(to: CGPoint(x: 0.61958*width, y: 0.77732*height), control1: CGPoint(x: 0.66833*width, y: 0.75372*height), control2: CGPoint(x: 0.64583*width, y: 0.76732*height))
        path.addLine(to: CGPoint(x: 0.60417*width, y: 0.88332*height))
        path.addCurve(to: CGPoint(x: 0.58333*width, y: 0.90012*height), control1: CGPoint(x: 0.6025*width, y: 0.89292*height), control2: CGPoint(x: 0.59375*width, y: 0.90012*height))
        path.addLine(to: CGPoint(x: 0.41667*width, y: 0.90012*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.46875*width, y: 0.18012*height))
        path.addLine(to: CGPoint(x: 0.45333*width, y: 0.28452*height))
        path.addCurve(to: CGPoint(x: 0.32708*width, y: 0.35572*height), control1: CGPoint(x: 0.40333*width, y: 0.29452*height), control2: CGPoint(x: 0.35917*width, y: 0.32012*height))
        path.addLine(to: CGPoint(x: 0.22667*width, y: 0.31412*height))
        path.addLine(to: CGPoint(x: 0.19542*width, y: 0.36612*height))
        path.addLine(to: CGPoint(x: 0.28333*width, y: 0.42812*height))
        path.addCurve(to: CGPoint(x: 0.28333*width, y: 0.57212*height), control1: CGPoint(x: 0.26667*width, y: 0.47492*height), control2: CGPoint(x: 0.26667*width, y: 0.52572*height))
        path.addLine(to: CGPoint(x: 0.195*width, y: 0.63452*height))
        path.addLine(to: CGPoint(x: 0.22625*width, y: 0.68652*height))
        path.addLine(to: CGPoint(x: 0.3275*width, y: 0.64492*height))
        path.addCurve(to: CGPoint(x: 0.45292*width, y: 0.71532*height), control1: CGPoint(x: 0.35958*width, y: 0.68012*height), control2: CGPoint(x: 0.40333*width, y: 0.70572*height))
        path.addLine(to: CGPoint(x: 0.46833*width, y: 0.82012*height))
        path.addLine(to: CGPoint(x: 0.53167*width, y: 0.82012*height))
        path.addLine(to: CGPoint(x: 0.54708*width, y: 0.71572*height))
        path.addCurve(to: CGPoint(x: 0.6725*width, y: 0.64492*height), control1: CGPoint(x: 0.59667*width, y: 0.70572*height), control2: CGPoint(x: 0.64042*width, y: 0.68012*height))
        path.addLine(to: CGPoint(x: 0.77375*width, y: 0.68652*height))
        path.addLine(to: CGPoint(x: 0.805*width, y: 0.63452*height))
        path.addLine(to: CGPoint(x: 0.71667*width, y: 0.57252*height))
        path.addCurve(to: CGPoint(x: 0.71667*width, y: 0.42812*height), control1: CGPoint(x: 0.73333*width, y: 0.52572*height), control2: CGPoint(x: 0.73333*width, y: 0.47492*height))
        path.addLine(to: CGPoint(x: 0.80458*width, y: 0.36612*height))
        path.addLine(to: CGPoint(x: 0.77333*width, y: 0.31412*height))
        path.addLine(to: CGPoint(x: 0.67292*width, y: 0.35572*height))
        path.addCurve(to: CGPoint(x: 0.54667*width, y: 0.28492*height), control1: CGPoint(x: 0.64083*width, y: 0.32012*height), control2: CGPoint(x: 0.59667*width, y: 0.29452*height))
        path.addLine(to: CGPoint(x: 0.53125*width, y: 0.18012*height))
        path.addLine(to: CGPoint(x: 0.46875*width, y: 0.18012*height))
        path.closeSubpath()
        return path
    }
}

private struct FormatListChecksShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.125*width, y: 0.22929*height))
        path.addLine(to: CGPoint(x: 0.375*width, y: 0.22929*height))
        path.addLine(to: CGPoint(x: 0.375*width, y: 0.4793*height))
        path.addLine(to: CGPoint(x: 0.125*width, y: 0.4793*height))
        path.addLine(to: CGPoint(x: 0.125*width, y: 0.22929*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.20833*width, y: 0.31263*height))
        path.addLine(to: CGPoint(x: 0.20833*width, y: 0.39596*height))
        path.addLine(to: CGPoint(x: 0.29167*width, y: 0.39596*height))
        path.addLine(to: CGPoint(x: 0.29167*width, y: 0.31263*height))
        path.addLine(to: CGPoint(x: 0.20833*width, y: 0.31263*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.45833*width, y: 0.31263*height))
        path.addLine(to: CGPoint(x: 0.875*width, y: 0.31263*height))
        path.addLine(to: CGPoint(x: 0.875*width, y: 0.39596*height))
        path.addLine(to: CGPoint(x: 0.45833*width, y: 0.39596*height))
        path.addLine(to: CGPoint(x: 0.45833*width, y: 0.31263*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.45833*width, y: 0.64596*height))
        path.addLine(to: CGPoint(x: 0.875*width, y: 0.64596*height))
        path.addLine(to: CGPoint(x: 0.875*width, y: 0.7293*height))
        path.addLine(to: CGPoint(x: 0.45833*width, y: 0.7293*height))
        path.addLine(to: CGPoint(x: 0.45833*width, y: 0.64596*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.20833*width, y: 0.8543*height))
        path.addLine(to: CGPoint(x: 0.0625*width, y: 0.70846*height))
        path.addLine(to: CGPoint(x: 0.12125*width, y: 0.64971*height))
        path.addLine(to: CGPoint(x: 0.20833*width, y: 0.73638*height))
        path.addLine(to: CGPoint(x: 0.39958*width, y: 0.54555*height))
        path.addLine(to: CGPoint(x: 0.45833*width, y: 0.6043*height))
        path.addLine(to: CGPoint(x: 0.20833*width, y: 0.8543*height))
        path.closeSubpath()
        return path
    }
}

private struct GiftShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.3775*width, y: 0.10138*height))
        path.addCurve(to: CGPoint(x: 0.25708*width, y: 0.27096*height), control1: CGPoint(x: 0.29875*width, y: 0.10096*height), control2: CGPoint(x: 0.22208*width, y: 0.17679*height))
        path.addLine(to: CGPoint(x: 0.125*width, y: 0.27096*height))
        path.addCurve(to: CGPoint(x: 0.06607*width, y: 0.29537*height), control1: CGPoint(x: 0.1029*width, y: 0.27096*height), control2: CGPoint(x: 0.0817*width, y: 0.27974*height))
        path.addCurve(to: CGPoint(x: 0.04167*width, y: 0.35429*height), control1: CGPoint(x: 0.05045*width, y: 0.311*height), control2: CGPoint(x: 0.04167*width, y: 0.33219*height))
        path.addLine(to: CGPoint(x: 0.04167*width, y: 0.43763*height))
        path.addCurve(to: CGPoint(x: 0.05387*width, y: 0.46709*height), control1: CGPoint(x: 0.04167*width, y: 0.44868*height), control2: CGPoint(x: 0.04606*width, y: 0.45928*height))
        path.addCurve(to: CGPoint(x: 0.08333*width, y: 0.4793*height), control1: CGPoint(x: 0.06168*width, y: 0.4749*height), control2: CGPoint(x: 0.07228*width, y: 0.4793*height))
        path.addLine(to: CGPoint(x: 0.45833*width, y: 0.4793*height))
        path.addLine(to: CGPoint(x: 0.45833*width, y: 0.35429*height))
        path.addLine(to: CGPoint(x: 0.54167*width, y: 0.35429*height))
        path.addLine(to: CGPoint(x: 0.54167*width, y: 0.4793*height))
        path.addLine(to: CGPoint(x: 0.91667*width, y: 0.4793*height))
        path.addCurve(to: CGPoint(x: 0.94613*width, y: 0.46709*height), control1: CGPoint(x: 0.92772*width, y: 0.4793*height), control2: CGPoint(x: 0.93832*width, y: 0.4749*height))
        path.addCurve(to: CGPoint(x: 0.95833*width, y: 0.43763*height), control1: CGPoint(x: 0.95394*width, y: 0.45928*height), control2: CGPoint(x: 0.95833*width, y: 0.44868*height))
        path.addLine(to: CGPoint(x: 0.95833*width, y: 0.35429*height))
        path.addCurve(to: CGPoint(x: 0.93393*width, y: 0.29537*height), control1: CGPoint(x: 0.95833*width, y: 0.33219*height), control2: CGPoint(x: 0.94955*width, y: 0.311*height))
        path.addCurve(to: CGPoint(x: 0.875*width, y: 0.27096*height), control1: CGPoint(x: 0.9183*width, y: 0.27974*height), control2: CGPoint(x: 0.8971*width, y: 0.27096*height))
        path.addLine(to: CGPoint(x: 0.74292*width, y: 0.27096*height))
        path.addCurve(to: CGPoint(x: 0.52375*width, y: 0.15596*height), control1: CGPoint(x: 0.79167*width, y: 0.13471*height), control2: CGPoint(x: 0.60833*width, y: 0.03846*height))
        path.addLine(to: CGPoint(x: 0.5*width, y: 0.18763*height))
        path.addLine(to: CGPoint(x: 0.47625*width, y: 0.15513*height))
        path.addCurve(to: CGPoint(x: 0.3775*width, y: 0.10138*height), control1: CGPoint(x: 0.45*width, y: 0.11804*height), control2: CGPoint(x: 0.41375*width, y: 0.10179*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.375*width, y: 0.18763*height))
        path.addCurve(to: CGPoint(x: 0.40458*width, y: 0.25888*height), control1: CGPoint(x: 0.41208*width, y: 0.18763*height), control2: CGPoint(x: 0.43083*width, y: 0.23263*height))
        path.addCurve(to: CGPoint(x: 0.33333*width, y: 0.22929*height), control1: CGPoint(x: 0.37833*width, y: 0.28513*height), control2: CGPoint(x: 0.33333*width, y: 0.26638*height))
        path.addCurve(to: CGPoint(x: 0.34554*width, y: 0.19983*height), control1: CGPoint(x: 0.33333*width, y: 0.21824*height), control2: CGPoint(x: 0.33772*width, y: 0.20764*height))
        path.addCurve(to: CGPoint(x: 0.375*width, y: 0.18763*height), control1: CGPoint(x: 0.35335*width, y: 0.19202*height), control2: CGPoint(x: 0.36395*width, y: 0.18763*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.625*width, y: 0.18763*height))
        path.addCurve(to: CGPoint(x: 0.65458*width, y: 0.25888*height), control1: CGPoint(x: 0.66208*width, y: 0.18763*height), control2: CGPoint(x: 0.68083*width, y: 0.23263*height))
        path.addCurve(to: CGPoint(x: 0.58333*width, y: 0.22929*height), control1: CGPoint(x: 0.62833*width, y: 0.28513*height), control2: CGPoint(x: 0.58333*width, y: 0.26638*height))
        path.addCurve(to: CGPoint(x: 0.59554*width, y: 0.19983*height), control1: CGPoint(x: 0.58333*width, y: 0.21824*height), control2: CGPoint(x: 0.58772*width, y: 0.20764*height))
        path.addCurve(to: CGPoint(x: 0.625*width, y: 0.18763*height), control1: CGPoint(x: 0.60335*width, y: 0.19202*height), control2: CGPoint(x: 0.61395*width, y: 0.18763*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.08333*width, y: 0.52096*height))
        path.addLine(to: CGPoint(x: 0.08333*width, y: 0.8543*height))
        path.addCurve(to: CGPoint(x: 0.10774*width, y: 0.91322*height), control1: CGPoint(x: 0.08333*width, y: 0.8764*height), control2: CGPoint(x: 0.09211*width, y: 0.89759*height))
        path.addCurve(to: CGPoint(x: 0.16667*width, y: 0.93763*height), control1: CGPoint(x: 0.12337*width, y: 0.92885*height), control2: CGPoint(x: 0.14457*width, y: 0.93763*height))
        path.addLine(to: CGPoint(x: 0.83333*width, y: 0.93763*height))
        path.addCurve(to: CGPoint(x: 0.89226*width, y: 0.91322*height), control1: CGPoint(x: 0.85543*width, y: 0.93763*height), control2: CGPoint(x: 0.87663*width, y: 0.92885*height))
        path.addCurve(to: CGPoint(x: 0.91667*width, y: 0.8543*height), control1: CGPoint(x: 0.90789*width, y: 0.89759*height), control2: CGPoint(x: 0.91667*width, y: 0.8764*height))
        path.addLine(to: CGPoint(x: 0.91667*width, y: 0.52096*height))
        path.addLine(to: CGPoint(x: 0.54167*width, y: 0.52096*height))
        path.addLine(to: CGPoint(x: 0.54167*width, y: 0.8543*height))
        path.addLine(to: CGPoint(x: 0.45833*width, y: 0.8543*height))
        path.addLine(to: CGPoint(x: 0.45833*width, y: 0.52096*height))
        path.addLine(to: CGPoint(x: 0.08333*width, y: 0.52096*height))
        path.closeSubpath()
        return path
    }
}

private struct GiftOutlineShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.9182*width, y: 0.5*height))
        path.addLine(to: CGPoint(x: 0.9182*width, y: 0.83333*height))
        path.addCurve(to: CGPoint(x: 0.8938*width, y: 0.89226*height), control1: CGPoint(x: 0.9182*width, y: 0.85543*height), control2: CGPoint(x: 0.90943*width, y: 0.87663*height))
        path.addCurve(to: CGPoint(x: 0.83487*width, y: 0.91667*height), control1: CGPoint(x: 0.87817*width, y: 0.90789*height), control2: CGPoint(x: 0.85697*width, y: 0.91667*height))
        path.addLine(to: CGPoint(x: 0.16821*width, y: 0.91667*height))
        path.addCurve(to: CGPoint(x: 0.10928*width, y: 0.89226*height), control1: CGPoint(x: 0.1461*width, y: 0.91667*height), control2: CGPoint(x: 0.12491*width, y: 0.90789*height))
        path.addCurve(to: CGPoint(x: 0.08487*width, y: 0.83333*height), control1: CGPoint(x: 0.09365*width, y: 0.87663*height), control2: CGPoint(x: 0.08487*width, y: 0.85543*height))
        path.addLine(to: CGPoint(x: 0.08487*width, y: 0.5*height))
        path.addCurve(to: CGPoint(x: 0.05541*width, y: 0.4878*height), control1: CGPoint(x: 0.07382*width, y: 0.5*height), control2: CGPoint(x: 0.06322*width, y: 0.49561*height))
        path.addCurve(to: CGPoint(x: 0.04321*width, y: 0.45833*height), control1: CGPoint(x: 0.0476*width, y: 0.47998*height), control2: CGPoint(x: 0.04321*width, y: 0.46938*height))
        path.addLine(to: CGPoint(x: 0.04321*width, y: 0.33333*height))
        path.addCurve(to: CGPoint(x: 0.06761*width, y: 0.27441*height), control1: CGPoint(x: 0.04321*width, y: 0.31123*height), control2: CGPoint(x: 0.05199*width, y: 0.29004*height))
        path.addCurve(to: CGPoint(x: 0.12654*width, y: 0.25*height), control1: CGPoint(x: 0.08324*width, y: 0.25878*height), control2: CGPoint(x: 0.10444*width, y: 0.25*height))
        path.addLine(to: CGPoint(x: 0.25862*width, y: 0.25*height))
        path.addCurve(to: CGPoint(x: 0.25154*width, y: 0.20833*height), control1: CGPoint(x: 0.25404*width, y: 0.23708*height), control2: CGPoint(x: 0.25154*width, y: 0.22292*height))
        path.addCurve(to: CGPoint(x: 0.28815*width, y: 0.11995*height), control1: CGPoint(x: 0.25154*width, y: 0.17518*height), control2: CGPoint(x: 0.26471*width, y: 0.14339*height))
        path.addCurve(to: CGPoint(x: 0.37654*width, y: 0.08333*height), control1: CGPoint(x: 0.31159*width, y: 0.0965*height), control2: CGPoint(x: 0.34339*width, y: 0.08333*height))
        path.addCurve(to: CGPoint(x: 0.47779*width, y: 0.135*height), control1: CGPoint(x: 0.4182*width, y: 0.08333*height), control2: CGPoint(x: 0.45487*width, y: 0.10417*height))
        path.addLine(to: CGPoint(x: 0.47779*width, y: 0.13458*height))
        path.addLine(to: CGPoint(x: 0.50154*width, y: 0.16667*height))
        path.addLine(to: CGPoint(x: 0.52529*width, y: 0.13458*height))
        path.addLine(to: CGPoint(x: 0.52529*width, y: 0.135*height))
        path.addCurve(to: CGPoint(x: 0.62654*width, y: 0.08333*height), control1: CGPoint(x: 0.5482*width, y: 0.10417*height), control2: CGPoint(x: 0.58487*width, y: 0.08333*height))
        path.addCurve(to: CGPoint(x: 0.71493*width, y: 0.11995*height), control1: CGPoint(x: 0.65969*width, y: 0.08333*height), control2: CGPoint(x: 0.69149*width, y: 0.0965*height))
        path.addCurve(to: CGPoint(x: 0.75154*width, y: 0.20833*height), control1: CGPoint(x: 0.73837*width, y: 0.14339*height), control2: CGPoint(x: 0.75154*width, y: 0.17518*height))
        path.addCurve(to: CGPoint(x: 0.74445*width, y: 0.25*height), control1: CGPoint(x: 0.75154*width, y: 0.22292*height), control2: CGPoint(x: 0.74904*width, y: 0.23708*height))
        path.addLine(to: CGPoint(x: 0.87654*width, y: 0.25*height))
        path.addCurve(to: CGPoint(x: 0.93547*width, y: 0.27441*height), control1: CGPoint(x: 0.89864*width, y: 0.25*height), control2: CGPoint(x: 0.91984*width, y: 0.25878*height))
        path.addCurve(to: CGPoint(x: 0.95987*width, y: 0.33333*height), control1: CGPoint(x: 0.95109*width, y: 0.29004*height), control2: CGPoint(x: 0.95987*width, y: 0.31123*height))
        path.addLine(to: CGPoint(x: 0.95987*width, y: 0.45833*height))
        path.addCurve(to: CGPoint(x: 0.94767*width, y: 0.4878*height), control1: CGPoint(x: 0.95987*width, y: 0.46938*height), control2: CGPoint(x: 0.95548*width, y: 0.47998*height))
        path.addCurve(to: CGPoint(x: 0.9182*width, y: 0.5*height), control1: CGPoint(x: 0.93985*width, y: 0.49561*height), control2: CGPoint(x: 0.92926*width, y: 0.5*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.16821*width, y: 0.83333*height))
        path.addLine(to: CGPoint(x: 0.45987*width, y: 0.83333*height))
        path.addLine(to: CGPoint(x: 0.45987*width, y: 0.5*height))
        path.addLine(to: CGPoint(x: 0.16821*width, y: 0.5*height))
        path.addLine(to: CGPoint(x: 0.16821*width, y: 0.83333*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.83487*width, y: 0.83333*height))
        path.addLine(to: CGPoint(x: 0.83487*width, y: 0.5*height))
        path.addLine(to: CGPoint(x: 0.5432*width, y: 0.5*height))
        path.addLine(to: CGPoint(x: 0.5432*width, y: 0.83333*height))
        path.addLine(to: CGPoint(x: 0.83487*width, y: 0.83333*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.37654*width, y: 0.16667*height))
        path.addCurve(to: CGPoint(x: 0.34708*width, y: 0.17887*height), control1: CGPoint(x: 0.36549*width, y: 0.16667*height), control2: CGPoint(x: 0.35489*width, y: 0.17106*height))
        path.addCurve(to: CGPoint(x: 0.33487*width, y: 0.20833*height), control1: CGPoint(x: 0.33926*width, y: 0.18668*height), control2: CGPoint(x: 0.33487*width, y: 0.19728*height))
        path.addCurve(to: CGPoint(x: 0.34708*width, y: 0.2378*height), control1: CGPoint(x: 0.33487*width, y: 0.21938*height), control2: CGPoint(x: 0.33926*width, y: 0.22998*height))
        path.addCurve(to: CGPoint(x: 0.37654*width, y: 0.25*height), control1: CGPoint(x: 0.35489*width, y: 0.24561*height), control2: CGPoint(x: 0.36549*width, y: 0.25*height))
        path.addCurve(to: CGPoint(x: 0.406*width, y: 0.2378*height), control1: CGPoint(x: 0.38759*width, y: 0.25*height), control2: CGPoint(x: 0.39819*width, y: 0.24561*height))
        path.addCurve(to: CGPoint(x: 0.4182*width, y: 0.20833*height), control1: CGPoint(x: 0.41382*width, y: 0.22998*height), control2: CGPoint(x: 0.4182*width, y: 0.21938*height))
        path.addCurve(to: CGPoint(x: 0.406*width, y: 0.17887*height), control1: CGPoint(x: 0.4182*width, y: 0.19728*height), control2: CGPoint(x: 0.41382*width, y: 0.18668*height))
        path.addCurve(to: CGPoint(x: 0.37654*width, y: 0.16667*height), control1: CGPoint(x: 0.39819*width, y: 0.17106*height), control2: CGPoint(x: 0.38759*width, y: 0.16667*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.62654*width, y: 0.16667*height))
        path.addCurve(to: CGPoint(x: 0.59708*width, y: 0.17887*height), control1: CGPoint(x: 0.61549*width, y: 0.16667*height), control2: CGPoint(x: 0.60489*width, y: 0.17106*height))
        path.addCurve(to: CGPoint(x: 0.58487*width, y: 0.20833*height), control1: CGPoint(x: 0.58926*width, y: 0.18668*height), control2: CGPoint(x: 0.58487*width, y: 0.19728*height))
        path.addCurve(to: CGPoint(x: 0.59708*width, y: 0.2378*height), control1: CGPoint(x: 0.58487*width, y: 0.21938*height), control2: CGPoint(x: 0.58926*width, y: 0.22998*height))
        path.addCurve(to: CGPoint(x: 0.62654*width, y: 0.25*height), control1: CGPoint(x: 0.60489*width, y: 0.24561*height), control2: CGPoint(x: 0.61549*width, y: 0.25*height))
        path.addCurve(to: CGPoint(x: 0.656*width, y: 0.2378*height), control1: CGPoint(x: 0.63759*width, y: 0.25*height), control2: CGPoint(x: 0.64819*width, y: 0.24561*height))
        path.addCurve(to: CGPoint(x: 0.6682*width, y: 0.20833*height), control1: CGPoint(x: 0.66382*width, y: 0.22998*height), control2: CGPoint(x: 0.6682*width, y: 0.21938*height))
        path.addCurve(to: CGPoint(x: 0.656*width, y: 0.17887*height), control1: CGPoint(x: 0.6682*width, y: 0.19728*height), control2: CGPoint(x: 0.66382*width, y: 0.18668*height))
        path.addCurve(to: CGPoint(x: 0.62654*width, y: 0.16667*height), control1: CGPoint(x: 0.64819*width, y: 0.17106*height), control2: CGPoint(x: 0.63759*width, y: 0.16667*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.12654*width, y: 0.33333*height))
        path.addLine(to: CGPoint(x: 0.12654*width, y: 0.41667*height))
        path.addLine(to: CGPoint(x: 0.45987*width, y: 0.41667*height))
        path.addLine(to: CGPoint(x: 0.45987*width, y: 0.33333*height))
        path.addLine(to: CGPoint(x: 0.12654*width, y: 0.33333*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.5432*width, y: 0.33333*height))
        path.addLine(to: CGPoint(x: 0.5432*width, y: 0.41667*height))
        path.addLine(to: CGPoint(x: 0.87654*width, y: 0.41667*height))
        path.addLine(to: CGPoint(x: 0.87654*width, y: 0.33333*height))
        path.addLine(to: CGPoint(x: 0.5432*width, y: 0.33333*height))
        path.closeSubpath()
        return path
    }
}

private struct PlusThickShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.83333*width, y: 0.6043*height))
        path.addLine(to: CGPoint(x: 0.58333*width, y: 0.6043*height))
        path.addLine(to: CGPoint(x: 0.58333*width, y: 0.8543*height))
        path.addLine(to: CGPoint(x: 0.41667*width, y: 0.8543*height))
        path.addLine(to: CGPoint(x: 0.41667*width, y: 0.6043*height))
        path.addLine(to: CGPoint(x: 0.16667*width, y: 0.6043*height))
        path.addLine(to: CGPoint(x: 0.16667*width, y: 0.43763*height))
        path.addLine(to: CGPoint(x: 0.41667*width, y: 0.43763*height))
        path.addLine(to: CGPoint(x: 0.41667*width, y: 0.18763*height))
        path.addLine(to: CGPoint(x: 0.58333*width, y: 0.18763*height))
        path.addLine(to: CGPoint(x: 0.58333*width, y: 0.43763*height))
        path.addLine(to: CGPoint(x: 0.83333*width, y: 0.43763*height))
        path.addLine(to: CGPoint(x: 0.83333*width, y: 0.6043*height))
        path.closeSubpath()
        return path
    }
}

