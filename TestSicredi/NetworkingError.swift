//
//  NetworkingErrors.swift
//  TestSicredi
//
//  Created by George Gomes on 16/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import Foundation

enum NetworkingError: Error {
    case noConnection
    case fail
    case notFound
    case decodeError
    case invalidURL
}

extension NetworkingError {
    init(error: Error){
        if let error = error as? NetworkingError{
            self = error
            return
        }
        
        switch error {
        default:
            self = .fail
        }
    }
}
