//
//  ExampleView.swift
//  ShimmerEffect (iOS)
//
//  Created by Hung-Chun Tsai on 2022-07-09.
//

import SwiftUI

struct ExampleView: View {
    @State private var isRedacted = true

    var body: some View {
        ScrollView {
            DummyRowView()
                .redacted(if: isRedacted)
            Button {
                isRedacted.toggle()
            } label: {
                Text("Toggle redacted...")
            }

        }
    }
}

struct ExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}
