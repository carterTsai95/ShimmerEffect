//
//  DescriptionView.swift
//  ShimmerEffect (iOS)
//
//  Created by Hung-Chun Tsai on 2022-07-09.
//

import SwiftUI

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

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(description: "Your title") {
            Text("Result at here")
                .padding()
                .border(.blue)
        }
    }
}
