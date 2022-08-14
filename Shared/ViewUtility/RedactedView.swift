//
//  RedactedView.swift
//  ShimmerEffect (iOS)
//
//  Created by Hung-Chun Tsai on 2022-07-11.
//

import SwiftUI

// Create the easy access for Shimmer effect
extension View {
    func redacted(if condition: Bool) -> some View {
        modifier(
            ShimmerViewModifier(
                condition: condition,
                configuration: .default
            )
        )
    }
}

extension View where Self: ShimmerRedactableView {
    func redacted(when condition: Bool) -> some View {
        modifier(
            GenericShimmerRedViewModifier<Self>(shimmerView: Self.shimmerView,
                                                condition: condition,
                                                configuration: .default)
        )
    }

}
