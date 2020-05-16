//
//  BaseCoordinator.swift
//  TestSicredi
//
//  Created by George Gomes on 16/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import Foundation

class BaseCoordinator: Coordinator {

    var childs: [Coordinator] = []
    var isCompleted: (() -> Void)?

    func start() {
        start(with: nil)
    }

    func start(with option: DeepLinkOption?) {
        fatalError("Childrens should implement start function")
    }
    // add only unique object
    func addDependency(_ coordinator: Coordinator) {
        guard !childs.contains(where: { $0 === coordinator }) else { return }
        childs.append(coordinator)
    }

    func removeDependency(_ coordinator: Coordinator?) {
        guard childs.isEmpty == false, let coordinator = coordinator else { return }

        for (index, element) in childs.enumerated() {
            if element === coordinator {
                childs.remove(at: index)
                break
            }
        }
    }
}
