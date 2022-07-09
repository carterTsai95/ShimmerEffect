//
//  ShimmerModifier.swift
//  ShimmerEffect (iOS)
//
//  Created by Hung-Chun Tsai on 2022-07-09.
//

import SwiftUI

public struct ShimmerModifier: ViewModifier {
    // MARK: Shimmer Configuration
    let gradient = Gradient(stops: [
        .init(color: .black, location: 0),
        .init(color: .white, location: 0.5),
        .init(color: .black, location: 1),
    ])
    
    @State private var initialStartPoint = UnitPoint(x: -1, y: 0)
    @State private var initialEndPoint = UnitPoint(x: 0, y: 0)
    @State private var desiredStartPoint = UnitPoint(x: 1, y: 0)
    @State private var desiredEndPoint = UnitPoint(x: 2, y: 0)
    
    public func body(content: Content) -> some View {
        content
            .overlay {
                LinearGradient(
                    gradient: gradient,
                    startPoint: initialStartPoint,
                    endPoint: initialEndPoint
                )
                .blendMode(.screen)
                .onAppear {
                    withAnimation(
                        Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                            initialStartPoint = desiredStartPoint
                            initialEndPoint = desiredEndPoint
                        }
                }
            }
    }
}

public extension View {
    func shimmer() -> some View {
        modifier(ShimmerModifier())
    }
}

struct ShimmerModifier_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(description: "Shimmer modifier usage example") {
            Text("Result at here")
                .padding()
                .border(.blue)
        }
    }
}
