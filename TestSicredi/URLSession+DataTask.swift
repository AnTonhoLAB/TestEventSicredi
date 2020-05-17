//
//  URLSession+DataTask.swift
//  TestSicredi
//
//  Created by George Gomes on 16/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import Foundation

extension URLSession {

    /**
    Make a request and complete with the expected type in a `Result`.

    Calling this method to abstract a request`.
     
        guard let url =  URL(string: "www.someurl.com") else {
         completion(.failure(.urlBuildingError))
         return
        }
        let completionHandler: (Result<Foo, Error>) -> Void = responseBuilder(completion: completion)
        URLSession.shared.dataTask(with: url, completion: completionHandler).resume()

    - Parameter url: The url to make a request.
    - Parameter completion: The url to make a request.
    - Precondition: `url` must be a valid url.
    */
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
    
//    /// This function make a request and complete with the Data in a `Result`
//    func dataTaskData(with url: URL, completion: @escaping (Result<Data, Error>) -> Void) -> URLSessionDataTask {
//        return dataTask(with: url) { (data, response, error) in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//            guard let data = data else {
//                let error = NSError(domain: "error", code: 0, userInfo: nil)
//                completion(.failure(error))
//                return
//            }
//            completion(.success(data))
//        }
//    }
}
