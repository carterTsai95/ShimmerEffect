//
//  ContentView.swift
//  Shared
//
//  Created by Hung-Chun Tsai on 2022-07-08.
//

import SwiftUI

struct ContentView: View {
    
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
    
    var body: some View {
        VStack {
            
            // Step 1: Create the LinearGradient mask which can shift the gradient color base on the startPoint and endPoint
            
            // MARK: Offset control for Step 1 and Step 2
            Slider(value: $offset, in: 0...2) { editing in
            }.padding(.horizontal, 50)
            
            /* Note:
             1. startPoint X: 0 equal leading
             2. startPoint X: 1 equal trailing
             
             The purpose we want to shift our shimmer effect from the leading to trailing. In order to do that, we shift our startPoint to -1 which will be left side of leading. At this moment the end point will be 0 which will be our leading.
             */
            ResultView(description: "Result of step 1") {
                LinearGradient(
                    gradient: gradient,
                    startPoint: UnitPoint(x: startPoint, y: 0),
                    endPoint: UnitPoint(x: endPoint, y: 0)
                ).frame(width: 300, height: 50, alignment: .center)
                    .cornerRadius(10)
            }
            
            
            // Step 2: Leaverage the blendMode to see the expected effect on redacted modifier
            ResultView(description: "Result of step 2") {
                HStack {
                    Text("Test: ")
                    Text("Text for testing redacted")
                }
                .redacted(reason: .placeholder)
                // Using overlay and blendMode to make the effect mask on the desired view
                .overlay {
                    LinearGradient(
                        gradient: gradient,
                        startPoint: UnitPoint(x: startPoint, y: 0),
                        endPoint: UnitPoint(x: endPoint, y: 0)
                    ).blendMode(.screen)
                }
            }
            
            // Step 3:
            ResultView(description: "Result of step 3") {
                HStack {
                    Text("Test: ")
                    Text("Text for testing redacted")
                }
                .redacted(reason: .placeholder)
                .overlay {
                    LinearGradient(
                        gradient: gradient,
                        startPoint: initialStartPoint,
                        endPoint: initialEndPoint
                    )
                    .blendMode(.screen)
                    // When the view appear adding adding the animation and change the startPoint
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
    }
    
    struct ResultView<Content: View>: View {
        private let description: String
        private let content: () -> Content
        
        init(
            description: String,
            @ViewBuilder content: @escaping () -> Content
        ) {
            self.description = description
            self.content = content
        }
        var body: some View {
            VStack {
                Text(description)
                    .font(.footnote)
                content()
            }.padding()
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
