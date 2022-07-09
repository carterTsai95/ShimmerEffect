//
//  RedactedModifier.swift
//  ShimmerEffect (iOS)
//
//  Created by Hung-Chun Tsai on 2022-07-09.
//

import SwiftUI

extension View {
    func redacted(if condition: Bool) -> some View {
        modifier(Redacted(condition: condition))
    }
}

private struct Redacted: ViewModifier {
    let condition: Bool
    
    func body(content: Content) -> some View {
        content.if(condition) {
            $0
                .redacted(reason: .placeholder)
                .shimmer()
        }
    }
}
