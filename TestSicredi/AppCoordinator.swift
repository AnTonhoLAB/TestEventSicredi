//
//  AppCoordinator.swift
//  TestSicredi
//
//  Created by George Gomes on 16/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import UIKit

enum DeepLinkOption {
    case login
    case `default`
}

private enum AppCoordinatorTransition {
    case goToOnboarding
    case goToStore
    case goToAdditionalInfo
}

final class AppCoordinator: BaseCoordinator {

    // MARK: - Vars & Lets

    private let coordinatorFactory: CoordinatorFactoryProtocol
    private let router: RouterProtocol
    private var launchInstructor = LaunchInstructor().configure()
    private let viewControllerFactory: ViewControllerFactoryProtocol = ViewControllerFactory()

    init(router: Router, coordinatorFactory: CoordinatorFactoryProtocol) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }

    override func start() {
        runListFlow()
    }

    override func start(with option: DeepLinkOption?) {
        
        if option != nil {

        } else {
           switch launchInstructor {
            case .list: runListFlow()
            case .userInformation: runUserInformationFlow()
            }
       }
    }

    private func runListFlow() {
        let listCoordinator = coordinatorFactory.makeListCoordinatorBox(router: self.router, coordinatorFactory: self.coordinatorFactory, viewControllerFactory: self.viewControllerFactory)

        listCoordinator.finishFlow = { [unowned self, unowned listCoordinator] in
            self.removeDependency(listCoordinator)
            self.launchInstructor = LaunchInstructor().configure()
            self.start(with: nil)
        }
        self.addChild(coordinator: listCoordinator)
        listCoordinator.start()
    }

    private func runUserInformationFlow() {

    }
}

extension AppCoordinator {
    fileprivate func handle(transition: AppCoordinatorTransition) {

    }
}

