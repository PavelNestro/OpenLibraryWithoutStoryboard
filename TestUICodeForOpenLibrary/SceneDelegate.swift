//
//  SceneDelegate.swift
//  TestUICodeForOpenLibrary
//
//  Created by Pavel Nesterenko on 15.05.23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = createTabBarController()
        window?.makeKeyAndVisible()
    }
    
    func createViewController() -> UINavigationController {
        let viewController = ViewController()
        viewController.title = "Books"
        viewController.tabBarItem = UITabBarItem(title: "List", image: UIImage(systemName: "list.clipboard"), selectedImage: UIImage(systemName: "list.clipboard.fill"))
        return UINavigationController(rootViewController: viewController)
    }

    func createPersonViewController() -> UINavigationController {
        let viewController = PersonViewController()
        viewController.title = "Person"
        viewController.tabBarItem = UITabBarItem(title: "Person", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        return UINavigationController(rootViewController: viewController)
    }
    
    func createTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        UITabBar.appearance().backgroundColor = .systemGray
        tabBarController.viewControllers = [createViewController(), createPersonViewController()]
        return tabBarController
    }
    
}

