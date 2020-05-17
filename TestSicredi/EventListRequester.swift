//
//  EventListRequester.swift
//  TestSicredi
//
//  Created by George Gomes on 16/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import Foundation

protocol EventListRequesterProtocol {
    func getList(completion: @escaping (Result<EventList, NetworkingError>) -> Void)
}

class EventListRequester: EventListRequesterProtocol {
     private var credentials: Credentiable!
     
     init(_ credentials: Credentiable?) {
         if let credentials = credentials {
             self.credentials = credentials
         } else {
             self.credentials = Credentials()
         }
     }
    
    
    func getList(completion: @escaping (Result<EventList, NetworkingError>) -> Void) {
            
        guard let url =  URL(string: credentials.url + credentials.basePath + credentials.events) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let completionHandler: (Result<EventList, Error>) -> Void = ResponseBuilder.build(completion: completion)
        URLSession.shared.dataTask(with: url, completion: completionHandler).resume()
    }
}
