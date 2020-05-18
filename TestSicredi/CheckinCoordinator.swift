//
//  CheckinCoordinator.swift
//  TestSicredi
//
//  Created by George Gomes on 18/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import Foundation

class CheckinCoordinator: BaseCoordinator {
    // MARK: - Constants
    private let router: RouterProtocol
    private let coordinatorFactory: CoordinatorFactoryProtocol
    private let viewControllerFactory: ViewControllerFactoryProtocol
    private let event: Event
    // MARK: - Variables
    var finishFlow: (() -> Void)?

    // MARK: - Life Cycle
    init(event: Event, router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, viewControllerFactory: ViewControllerFactoryProtocol) {
        self.event = event
        self.router = router
        self.coordinatorFactory = coordinatorFactory
        self.viewControllerFactory = viewControllerFactory
    }
    
    // MARK: - Functions
    override func start() {
        self.checkinEvent()
    }

    private func checkinEvent() {
        let checkinVC = self.viewControllerFactory.instantiateEventCheckin(event: self.event)

        checkinVC.finishFlow = {
            self.finishFlow?()
        }

        self.router.push(checkinVC, hideBar: false)
    }
    
   
    
}
