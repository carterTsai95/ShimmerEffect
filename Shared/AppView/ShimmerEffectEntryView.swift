//
//  ShimmerEffectEntryView.swift
//  ShimmerEffect (iOS)
//
//  Created by Hung-Chun Tsai on 2022-07-10.
//

import SwiftUI

struct ShimmerEffectEntryView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(
                    destination: ImplementationStepsView()
                        .navigationTitle("Implementation Steps")
                        .navigationBarTitleDisplayMode(.inline)
                ) {
                    Text("Implementation Steps")
                }

                NavigationLink(
                    destination: ExampleView()
                        .navigationTitle("Example and usage")
                        .navigationBarTitleDisplayMode(.inline)
                ) {
                    Text("Example and usage")
                }
            }
            .navigationTitle("Navigation")
        }
        .navigationViewStyle(.stack)
    }
}

struct ShimmerEffectEntryView_Previews: PreviewProvider {
    static var previews: some View {
        ShimmerEffectEntryView()
    }
}
