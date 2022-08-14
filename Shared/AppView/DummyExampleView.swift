//
//  DummyExampleView.swift
//  ShimmerEffect (iOS)
//
//  Created by Cédric Bahirwe on 14/08/2022.
//

import SwiftUI

struct DummyExampleView: View {
    @State private var isRedacted = true
    
    var body: some View {
        ScrollView {
            DummyModelRowView(model: .default)
                .redacted(when: isRedacted)
            Button {
                isRedacted.toggle()
            } label: {
                Text("Toggle redacted...")
            }
            
        }
    }
}

struct DummyExampleView_Previews: PreviewProvider {
    static var previews: some View {
        DummyExampleView()
    }
}
