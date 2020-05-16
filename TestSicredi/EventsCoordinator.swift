//
//  EventListCoordinator.swift
//  TestSicredi
//
//  Created by George Gomes on 16/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import Foundation

class EventsCoordinator: BaseCoordinator {

    private let router: RouterProtocol
    private let coordinatorFactory: CoordinatorFactoryProtocol
    private let viewControllerFactory: ViewControllerFactoryProtocol

    var finishFlow: (() -> Void)?

    init(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, viewControllerFactory: ViewControllerFactoryProtocol) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
        self.viewControllerFactory = viewControllerFactory
    }

    override func start() {
        self.openEventList()
    }

    private func openEventList() {
        let eventListVC = self.viewControllerFactory.instantiateEventListViewController() 
        self.router.setRootModule(eventListVC, hideBar: true)
    }
}
