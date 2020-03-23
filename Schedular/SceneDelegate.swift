//
//  SceneDelegate.swift
//  Schedular
//
//  Created by Kamaal Farah on 22/03/2020.
//  Copyright © 2020 Kamaal. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let item0 = UITabBarItem()
        item0.title = "Schedule"
        let item1 = UITabBarItem()
        item1.title = "Calendar"
        let firstVC = FirstViewController()
        firstVC.tabBarItem = item0
        let secondVC = SecondViewController()
        secondVC.tabBarItem = item1
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [firstVC, secondVC]
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) { }

    func sceneDidBecomeActive(_ scene: UIScene) { }

    func sceneWillResignActive(_ scene: UIScene) { }

    func sceneWillEnterForeground(_ scene: UIScene) { }

    func sceneDidEnterBackground(_ scene: UIScene) {
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }

}

