//
//  SceneDelegate.swift
//  chooseCar
//
//  Created by pavel on 8.12.21.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        let navController = UINavigationController(rootViewController: ChooseAssembly.build())
        self.window?.rootViewController = navController
        self.window?.makeKeyAndVisible()
    }
}

