//
//  Event.swift
//  TestSicredi
//
//  Created by George Gomes on 16/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import Foundation

// MARK: - EventElement
struct Event: Codable {
    let people: [Person]
    let date: Int
    let eventDescription: String
    let image: String
    let longitude, latitude, price: Double
    let title, id: String
    let cupons: [Cupon]

    enum CodingKeys: String, CodingKey {
        case people, date
        case eventDescription = "description"
        case image, longitude, latitude, price, title, id, cupons
    }
}

typealias EventList = [Event]
