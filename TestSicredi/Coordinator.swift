//
//  Coordinator.swift
//  TestSicredi
//
//  Created by George Gomes on 16/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import Foundation

protocol Coordinator: class {
    var childs: [Coordinator] { get set }
    func start()
    func start(with option: DeepLinkOption?)
}

extension Coordinator {
    func addChild(coordinator: Coordinator) {
        childs.append(coordinator)
    }

    func removeChild(coordinator: Coordinator) {
        childs = childs.filter { $0 !== coordinator }
    }
}
