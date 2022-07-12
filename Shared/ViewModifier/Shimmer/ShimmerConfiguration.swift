//
//  ShimmerConfiguration.swift
//  ShimmerEffect (iOS)
//
//  Created by Hung-Chun Tsai on 2022-07-11.
//

import SwiftUI

public struct ShimmerConfiguration {
    public let duration: TimeInterval
    public let opacity: Double
    public let effectRadius: Double
    public let centerColor: Color
    public let edgeColor: Color
    public static let `default` = ShimmerConfiguration(
        duration: 1.5,
        opacity: 0.3,
        effectRadius: 0.4,
        centerColor: .white,
        edgeColor: .black
    )
}
