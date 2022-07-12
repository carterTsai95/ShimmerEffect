//
//  IfModifier.swift
//  ShimmerEffect (iOS)
//
//  https://www.fivestars.blog/articles/conditional-modifiers/
//

import SwiftUI

extension View {
    @ViewBuilder func `if`<T>(_ condition: Bool, transform: (Self) -> T) -> some View where T : View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
