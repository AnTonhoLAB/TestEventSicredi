//
//  Credential.swift
//  TestSicredi
//
//  Created by George Gomes on 17/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import Foundation

protocol Credentiable {
    var url: String { get }
    var basePath: String { get }
    var events: String { get }
    var id: String { get }
    var checkin: String { get }
}

struct Credentials: Credentiable {
    var url = "http://5b840ba5db24a100142dcd8c.mockapi.io"
    var basePath = "/api"
    var events = "/events"
    var id = "/%@"
    var checkin = "/checkin"
}
