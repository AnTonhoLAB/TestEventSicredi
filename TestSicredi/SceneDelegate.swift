//
//  SceneDelegate.swift
//  TestSicredi
//
//  Created by George Gomes on 16/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window.windowScene = windowScene
        let controller = UINavigationController()
        window.rootViewController = controller
        self.window=window
        window.makeKeyAndVisible()
          
        let appcoordinator = AppCoordinator(router: Router(rootController: controller), coordinatorFactory: CoordinatorFactory())
          
        appcoordinator.start()
    }
}

