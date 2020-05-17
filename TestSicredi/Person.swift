//
//  Person.swift
//  TestSicredi
//
//  Created by George Gomes on 16/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import Foundation

// MARK: - Person
struct Person: Codable {
    let id, eventID, name, picture: String

    enum CodingKeys: String, CodingKey {
        case id
        case eventID = "eventId"
        case name, picture
    }
}
