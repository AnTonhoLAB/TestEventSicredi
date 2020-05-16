//
//  NetworkingState.swift
//  TestSicredi
//
//  Created by George Gomes on 16/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import Foundation

enum NetworkingState<T> {
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

extension NetworkingState {
    func toAny() -> NetworkingState<Any> {
        switch self{
            case .loading:
                return .loading
            case .success(let object):
                return .success(object)
            case .fail(let error):
                return .fail(error)
            case .default:
                return .default
        }
    }
}
