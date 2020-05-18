//
//  ResponseBuilder ResponseBuilder.swift
//  TestSicredi
//
//  Created by George Gomes on 16/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import Foundation

final class ResponseBuilder {
    private init() { }
    
    static func build<T>(completion: @escaping (Result<T, NetworkingError>) -> Void  ) -> (Result<T, Error>) -> Void where T: Decodable {
        return  { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                let networkingError = NetworkingError(error: error)
                completion(.failure(networkingError))
            }
        }
    }
}
