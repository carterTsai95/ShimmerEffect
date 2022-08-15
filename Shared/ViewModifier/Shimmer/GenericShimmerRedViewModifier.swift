//
//  GenericShimmerRedViewModifier.swift
//  ShimmerEffect (iOS)
//
//  Created by Cédric Bahirwe on 14/08/2022.
//

import SwiftUI

public struct GenericShimmerRedViewModifier<T: ShimmerRedactableView>: ViewModifier {
    private var shimmerView: T.ShimmerView
    @State private var progress: CGFloat = 0
    private let configuration: ShimmerConfiguration
    private let condition: Bool

    init(shimmerView: T.ShimmerView,
        condition: Bool,
        configuration: ShimmerConfiguration = .default
    ) {
        self.shimmerView = shimmerView
        self.condition = condition
        self.configuration = configuration
    }

    public func body(content: Content) -> some View {
        content
            .if(condition) { _ in
                shimmerView
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
