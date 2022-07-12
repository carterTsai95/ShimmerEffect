//
//  RedactedModifier.swift
//  ShimmerEffect (iOS)
//
//  Created by Hung-Chun Tsai on 2022-07-09.
//

import SwiftUI

public struct ShimmerViewModifier: ViewModifier {
    @State private var progress: CGFloat = 0
    let configuration: ShimmerConfiguration
    let condition: Bool

    init(
        condition: Bool,
        configuration: ShimmerConfiguration = .default
    ) {
        self.condition = condition
        self.configuration = configuration
    }
    
    public func body(content: Content) -> some View {
        content
            .if(condition) {
                $0
                    .redacted(reason: .placeholder)
                    .modifier(
                        ShimmerAnimation(
                            progress: progress,
                            configuration: configuration
                        )
                            .animation(
                                Animation.linear(duration: configuration.duration).repeatForever(autoreverses: false)
                            )
                    )
                    .onAppear {
                        progress = 1 + configuration.effectRadius
                    }
                    .onDisappear {
                        progress = 0
                    }
            }
    }
}
