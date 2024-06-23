//
//  WhiteBackdropBlurView.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-06-23.
//

import SwiftUI

struct TransparentBlurView: UIViewRepresentable {
    
    var removeAllFilters: Bool = false
    
    func makeUIView(context: Context) -> TransparentBlurViewHelper {
        let view = TransparentBlurViewHelper(removeAllFilters: removeAllFilters)
        return view
    }
    
    func updateUIView(_ uiView: TransparentBlurViewHelper, context: Context) {
        
    }
    
}

class TransparentBlurViewHelper: UIVisualEffectView {
    
    init(removeAllFilters: Bool) {
        super.init(effect: UIBlurEffect(style: .systemUltraThinMaterial))
        
        /// Removing background view, if it's available
        if subviews.indices.contains(1) {
            subviews[1].alpha = 0
        }
        
        if let backdropLayer = layer.sublayers?.first {
            if removeAllFilters {
                backdropLayer.filters = []
            } else {
                /// Removing All Except blur filter
                backdropLayer.filters?.removeAll(where: { filter in
                    String(describing: filter) != "gaussianBlur"
                })
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        
    }
}

struct WhiteBackdropBlurView: View {
    var body: some View {
        Rectangle()
            .foregroundColor(.whiteOp30)
            .background(
                TransparentBlurView(removeAllFilters: true)
                    .background(.clear)
                    .blur(radius: 4.0)
            )
            .clipShape(
                UnevenRoundedRectangle(
                    topLeadingRadius: 24,
                    topTrailingRadius: 24,
                    style: .continuous
                )
            )
            .shadow(color: .black.opacity(0.08), radius: 16)
    }
}

#Preview {
    WhiteBackdropBlurView()
}

