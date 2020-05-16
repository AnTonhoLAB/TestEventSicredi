//
//  AppDelegate.swift
//  TestSicredi
//
//  Created by George Gomes on 16/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
       
    var window: UIWindow?
    
    var rootController: UINavigationController {
          let window = UIWindow(frame: UIScreen.main.bounds)
          let controller = UINavigationController()
          window.rootViewController = controller
          self.window=window
          window.makeKeyAndVisible()
          return controller
      }
    
    private lazy var appCoordinator: Coordinator = AppCoordinator(router: Router(rootController: self.rootController), coordinatorFactory: CoordinatorFactory())
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//         self.appCoordinator.start(with: nil)
        return true
    }

}

