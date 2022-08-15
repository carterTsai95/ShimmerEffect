//
//  DummyModelRowView.swift
//  ShimmerEffect (iOS)
//
//  Created by Cédric Bahirwe on 14/08/2022.
//

import SwiftUI

struct DummyModelRowView: ShimmerRedactableView {
    static var shimmerView: some View { DummyModelRowView(model: .sample) }
    let model: DummyModel
    var body: some View {
        VStack {
            Image(systemName: model.image)
                .resizable()
                .frame(width: 100, height: 100)
            VStack(spacing: 10) {
                Text(model.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue)
                Text(model.description)
            }
        }
        .padding()
    }
}

struct DummyModelRowView_Previews: PreviewProvider {
    static var previews: some View {
        DummyModelRowView(model: .default)
    }
}
