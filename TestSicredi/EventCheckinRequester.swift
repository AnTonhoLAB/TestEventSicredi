//
//  EventCheckinRequester.swift
//  TestSicredi
//
//  Created by George Gomes on 18/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import Foundation

protocol EventCheckinRequesterProtocol {
    func checkin(id: String, name: String, email: String, completion: @escaping (Result<Data, NetworkingError>) -> Void)
}

class EventCheckinRequester: EventCheckinRequesterProtocol {
     private var credentials: Credentiable!
     
     init(_ credentials: Credentiable?) {
         if let credentials = credentials {
             self.credentials = credentials
         } else {
             self.credentials = Credentials()
         }
     }
    
    func checkin(id: String, name: String, email: String, completion: @escaping (Result<Data, NetworkingError>) -> Void) {
            
        guard let url =  URL(string: credentials.url + credentials.basePath + credentials.checkin) else {
            completion(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let parameters: [String: Any] = [
            "id": id,
            "name": name,
            "email": email
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch {
            completion(.failure(.invalidParameter))
        }
        
        let completionHandler: (Result<Data, Error>) -> Void = ResponseBuilder.build(completion: completion)
        URLSession.shared.dataTask(with: request, completion: completionHandler).resume()
    }
}
