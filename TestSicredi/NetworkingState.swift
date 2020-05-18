//
//  NetworkingState.swift
//  TestSicredi
//
//  Created by George Gomes on 16/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import Foundation

enum NetworkingState<T>: Equatable where T: Equatable  {
    case loading
    case success(T)
    case fail(Error)
    case `default`

    static func == (lhs: NetworkingState, rhs: NetworkingState) -> Bool {
        return lhs.id == rhs.id
    }

    var id: String  {
        switch self {
        case .loading:
            return "loading"
        case .success(_):
            return "succees"
        case .fail(_):
            return "fail"
        case .default:
            return "default"
        }
    }
}

