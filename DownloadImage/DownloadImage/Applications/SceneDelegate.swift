//
//  SceneDelegate.swift
//  DownloadImage
//
//  Created by pavel on 20.12.21.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        let rootVC = DownloadImageAssembly.build()
        self.window?.rootViewController = UINavigationController(rootViewController: rootVC)
        self.window?.makeKeyAndVisible()
    }
}

