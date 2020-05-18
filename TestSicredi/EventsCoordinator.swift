//
//  EventListCoordinator.swift
//  TestSicredi
//
//  Created by George Gomes on 16/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import Foundation

class EventsCoordinator: BaseCoordinator {

    // MARK: - Constants
    private let router: RouterProtocol
    private let coordinatorFactory: CoordinatorFactoryProtocol
    private let viewControllerFactory: ViewControllerFactoryProtocol

    // MARK: - Variables
    var finishFlow: (() -> Void)?

    // MARK: - Life Cycle
    init(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, viewControllerFactory: ViewControllerFactoryProtocol) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
        self.viewControllerFactory = viewControllerFactory
    }
    
    // MARK: - Functions
    override func start() {
        self.openEventList()
    }

    private func openEventList() {
        let eventListVC = self.viewControllerFactory.instantiateEventListViewController()

        eventListVC.openEvent = { event in
            self.openEvent(event: event)
        }
        
        self.router.setRootModule(eventListVC, hideBar: true)
    }
    
    private func openEvent(event: Event) {
        let eventDetailVC = self.viewControllerFactory.instantiateEventDetailViewController(event: event)
        
        self.router.push(eventDetailVC, hideBar: false)
    }
}
