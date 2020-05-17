//
//  URLSession+DataTask.swift
//  TestSicredi
//
//  Created by George Gomes on 16/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import Foundation

extension URLSession {
    /// This function make a request and complete with the expected type in a `Result`
    func dataTask<T>(with url: URL, completion: @escaping (Result<T, Error>) -> Void) -> URLSessionDataTask where T: Decodable {
        return dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                let error = NSError(domain: "error", code: 0, userInfo: nil)
                completion(.failure(error))
                return
            }
            
            do {
                let myNewObject = try Decoder.decodeObject(type: T.self, from: data)
                completion(.success(myNewObject))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    /// This function make a request and complete with the Data in a `Result`
    func dataTaskData(with url: URL, completion: @escaping (Result<Data, Error>) -> Void) -> URLSessionDataTask {
        return dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                let error = NSError(domain: "error", code: 0, userInfo: nil)
                completion(.failure(error))
                return
            }
            completion(.success(data))
        }
    }
}
