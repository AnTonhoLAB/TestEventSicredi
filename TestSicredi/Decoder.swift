//
//  Decodable+Decode.swift
//  TestSicredi
//
//  Created by George Gomes on 16/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import Foundation

enum DecodeError: Error {
    case decodingError
}

class Decoder {
    
    /// Generic decode to decode any object
    static func decodeObject<T>(type: T.Type, from data: Data) throws -> T where T: Decodable  {
        let decoder = JSONDecoder()
        do {
            decoder.dateDecodingStrategy = .millisecondsSince1970
            let objectFromDecode = try decoder.decode(T.self, from: data)
            return objectFromDecode
        } catch {
            throw DecodeError.decodingError
        }
    }
}
