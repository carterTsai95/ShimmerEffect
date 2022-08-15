//
//  DummyModel.swift
//  ShimmerEffect (iOS)
//
//  Created by Cédric Bahirwe on 14/08/2022.
//

import Foundation

struct DummyModel {
    let image: String
    let title: String
    let description: String

    static let `default` = DummyModel(image: "person.circle",
                                      title: "Lorem Ipsum",
                                      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book")

    static let sample = DummyModel(image: "house.fill",
                                   title: "The best title ever",
                                   description: "This is a description to showcase how providing a dummy data when the view is loading.")
}
