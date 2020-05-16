//
//  ViewControllerFactory.swift
//  TestSicredi
//
//  Created by George Gomes on 16/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import Foundation

protocol ViewControllerFactoryProtocol {
    func instantiateEventListViewController() -> EventListViewController
}

class ViewControllerFactory: ViewControllerFactoryProtocol {
    func instantiateEventListViewController() -> EventListViewController {
           let eventListView = EventListView()
//           let authRequester = AuthRequester()
//           let loginUseCase = LoginUseCase(authRequester: authRequester)
//           let loginViewModel = LoginViewModel(loginUseCase)
//           let loginVC = LoginViewController(with: loginView, and: loginViewModel)
           return EventListViewController(with: eventListView)
       }

}
