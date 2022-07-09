//
//  ExampleView.swift
//  ShimmerEffect (iOS)
//
//  Created by Hung-Chun Tsai on 2022-07-09.
//

import SwiftUI

struct ExampleView: View {
    var body: some View {
        VStack {
            DummyRowView()
                .redacted(if: true)
        }
    }
}

struct ExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}
