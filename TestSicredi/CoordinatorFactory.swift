//
//  CoordinatorFactory.swift
//  TestSicredi
//
//  Created by George Gomes on 16/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import Foundation


protocol CoordinatorFactoryProtocol {
     func makeListCoordinatorBox(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, viewControllerFactory: ViewControllerFactoryProtocol) -> EventsCoordinator
    func makeCheckinCoordinatorBox(event: Event, router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, viewControllerFactory: ViewControllerFactoryProtocol) -> CheckinCoordinator 
}

class CoordinatorFactory: CoordinatorFactoryProtocol {
    func makeListCoordinatorBox(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, viewControllerFactory: ViewControllerFactoryProtocol) -> EventsCoordinator {
        let coordinator = EventsCoordinator(router: router, coordinatorFactory: coordinatorFactory, viewControllerFactory: viewControllerFactory)
        return coordinator
    }
    
    func makeCheckinCoordinatorBox(event: Event, router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, viewControllerFactory: ViewControllerFactoryProtocol) -> CheckinCoordinator {
        let coordinator = CheckinCoordinator(event: event, router: router, coordinatorFactory: coordinatorFactory, viewControllerFactory: viewControllerFactory)
        return coordinator
    }
}
