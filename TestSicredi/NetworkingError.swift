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
    case invalidParameter
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
    
    public var errorDescription: String {
          switch self {
          case .noConnection:
            return NSLocalizedString("Aparentemente você não está conectado à internet, verifique a conexão e tente novamente", comment: "Erro de rede")
          case .fail:
            return NSLocalizedString("Falha ao fazer a solicitação, tente novamente em alguns instantes.", comment: "My error")
          case .notFound:
            return NSLocalizedString("Solicitação não encontrada, tente novamente em alguns instantes", comment: "My error")
          case .decodeError:
            return NSLocalizedString("Houve um erro inesperado, entre em contato com o administrador", comment: "Erro ao decodificar um objeto")
          case .invalidURL:
            return NSLocalizedString("Não foi possivel fazer a requisição, se persistir contate o administrador", comment: "Erro de chamada")
            case .invalidParameter:
            return NSLocalizedString("Não foi possivel fazer a requisição pois os dados não sao validos, se persistir contate o administrador", comment: "Erro de chamada")
        }
      }
}
