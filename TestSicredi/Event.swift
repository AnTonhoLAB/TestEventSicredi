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
    let people: [Person]?
    let date: Date?
    let eventDescription: String?
    let image: String?
    let longitude, latitude, price: Double?
    let title, id: String?
    let cupons: [Cupon]?

    enum CodingKeys: String, CodingKey {
        case people, date
        case eventDescription = "description"
        case image, longitude, latitude, price, title, id, cupons
    }
    
    init(people: [Person]? = nil, date: Date? = nil, eventDescription: String? = nil, image: String? = nil, longitude: Double? = nil, latitude: Double? = nil, price: Double? = nil, title:String? = nil, id: String? = nil, cupons: [Cupon]? = nil) {
       
        self.people = people
        self.date = date
        self.eventDescription = eventDescription
        self.image = image
        self.longitude = longitude
        self.latitude = latitude
        self.price = price
        self.title = title
        self.id = id
        self.cupons = cupons
    }
}

typealias EventList = [Event]
