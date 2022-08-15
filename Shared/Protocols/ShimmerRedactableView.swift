//
//  ShimmerRedactableView.swift
//  ShimmerEffect (iOS)
//
//  Created by Cédric Bahirwe on 14/08/2022.
//

import SwiftUI

public protocol ShimmerRedactableView: View {
    associatedtype ShimmerView: View

    @ViewBuilder static var shimmerView: Self.ShimmerView { get }
}
