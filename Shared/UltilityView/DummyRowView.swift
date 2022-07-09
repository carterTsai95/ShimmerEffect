//
//  DummyRowView.swift
//  ShimmerEffect (iOS)
//
//  Created by Hung-Chun Tsai on 2022-07-09.
//

import SwiftUI

struct DummyRowView: View {
    var body: some View {
        VStack {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 100, height: 100)
            VStack(spacing: 10) {
                Text("Lorem Ipsum")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue)
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book")
            }
        }
        .padding()
    }
}

struct DummyRowView_Previews: PreviewProvider {
    static var previews: some View {
        DummyRowView()
    }
}
