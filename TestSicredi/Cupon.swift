//
//  Cupon.swift
//  TestSicredi
//
//  Created by George Gomes on 16/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import Foundation

// MARK: - Cupon
struct Cupon: Codable {
    let id, eventID: String
    let discount: Int

    enum CodingKeys: String, CodingKey {
        case id
        case eventID = "eventId"
        case discount
    }
}

