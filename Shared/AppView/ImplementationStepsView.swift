//
//  ContentView.swift
//  Shared
//
//  Created by Hung-Chun Tsai on 2022-07-08.
//

import SwiftUI

struct ImplementationStepsView: View {
    
    // MARK: Step 1, 2 variable
    
    let gradient = Gradient(stops: [
        .init(color: .black, location: 0),
        .init(color: .white, location: 0.5),
        .init(color: .black, location: 1),
    ])
    
    @State private var offset = 0.0
    @State private var isEditing = false
    
    private var startPoint: CGFloat {
        CGFloat(-1 + offset)
    }
    
    private var endPoint: CGFloat {
        CGFloat(0 + offset)
    }

    @State private var initialStartPoint = UnitPoint(x: -1, y: 0)
    @State private var initialEndPoint = UnitPoint(x: 0, y: 0)
    @State private var desiredStartPoint = UnitPoint(x: 1, y: 0)
    @State private var desiredEndPoint = UnitPoint(x: 2, y: 0)
    

    @State private var progress = 0.0
    @State private var stepThreeProgress = 0.0
    private var effectRadius = 0.4
    let centerColor = Color.white.opacity(0.2)
    let edgeColor = Color.black

    var body: some View {
        ScrollView {
            HStack {
                Text("Animation progress: \(progress, specifier: "%.2f")")
            }

            // MARK: Offset control for Step 1 and Step 2

            Slider(value: $progress, in: 0...1 + effectRadius) { _ in }
                .padding(.horizontal, 50)
            
            /* Note:
             1. startPoint X: 0 equal leading
             2. startPoint X: 1 equal trailing
             
             The purpose we want to shift our shimmer effect from the leading to trailing. In order to do that, we shift our startPoint to -1 which will be left side of leading. At this moment the end point will be 0 which will be our leading.
             */
            ResultView(description: "Result of step 1") {
                LinearGradient(
                    gradient: Gradient(
                        stops: [
                            .init(color: edgeColor, location: -effectRadius + progress),
                            .init(color: centerColor, location: -effectRadius/2 + progress),
                            .init(color: edgeColor, location: progress)
                        ]
                    ),
                    startPoint: .leading,
                    endPoint: .trailing
                ).frame(width: 300, height: 50, alignment: .center)
            }
            
            
            // Step 2.1: Leaverage the mask modifier to see the expected effect on redacted modifier
            ResultView(description: "Result of step 2") {
                HStack {
                    Text("Test: ")
                    Text("Text for testing redacted")
                }
                .redacted(reason: .placeholder)
                .mask {
                    LinearGradient(
                        gradient: Gradient(
                            stops: [
                                .init(color: edgeColor, location: -effectRadius + progress),
                                .init(color: centerColor, location: -effectRadius/2 + progress),
                                .init(color: edgeColor, location: progress)
                            ]
                        ),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                }
            }
            
            // Step 3: Creating the animatable modifier and custom modifier for easy access.
            ResultView(description: "Result of step 3") {
                HStack {
                    Text("Test: ")
                    Text("Text for testing redacted")
                }
                .redacted(reason: .placeholder)
                .modifier(
                    ShimmerAnimation(
                        progress: stepThreeProgress,
                        effectRadius: effectRadius
                    )
                    .animation(
                        Animation.linear(duration: 1).repeatForever(autoreverses: false)
                    )
                )
                // When view appear, animate the mask from left to right
                .onAppear {
                    stepThreeProgress = 1 + effectRadius
                }
            }
        }
    }

    // Step 3.1 In order to create the loop animation, using animatable modifier to interpolate the progress value which will shift the mask between the view.

    /*
        Originate from https://github.com/markiv/SwiftUI-Shimmer
        - An animatable modifier to interpolate `progress` values while pass into modifier.
     */

    struct ShimmerAnimation: AnimatableModifier {
        var progress: CGFloat = 0
        var effectRadius: CGFloat = 0.4
        let centerColor = Color.white.opacity(0.2)
        let edgeColor = Color.black
        
        var animatableData: CGFloat {
            get {
                progress
            } set {
                progress = newValue
            }
        }
        
        func body(content: Content) -> some View {
            content.mask {
                LinearGradient(
                    gradient: Gradient(
                        stops: [
                            .init(color: edgeColor, location: -effectRadius + progress),
                            .init(color: centerColor, location: -effectRadius/2 + progress),
                            .init(color: edgeColor, location: progress)
                        ]
                    ),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            }
        }
    }
    
    struct ImplementationStepsView_Previews: PreviewProvider {
        static var previews: some View {
            ImplementationStepsView()
        }
    }
}
