//
//  ShimmerAnimatableModifier.swift
//  ShimmerEffect (iOS)
//
//  Created by Hung-Chun Tsai on 2022-07-11.
//

import SwiftUI

struct ShimmerAnimation: AnimatableModifier {
    var progress: CGFloat = 0
    var configuration: ShimmerConfiguration
    
    var animatableData: CGFloat {
        get {
            progress
        } set {
            progress = newValue
        }
    }

    init(
        progress: CGFloat,
        configuration: ShimmerConfiguration = .default
    ) {
        self.progress = progress
        self.configuration = configuration
    }
    
    func body(content: Content) -> some View {
        content.mask {
            LinearGradient(
                gradient: Gradient(
                    stops: [
                        .init(color: configuration.edgeColor, location: -configuration.effectRadius + progress),
                        .init(color: configuration.centerColor.opacity(configuration.opacity), location: -configuration.effectRadius/2 + progress),
                        .init(color: configuration.edgeColor, location: progress)
                    ]
                ),
                startPoint: .leading,
                endPoint: .trailing
            )
        }
    }
}
