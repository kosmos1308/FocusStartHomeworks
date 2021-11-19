//
//  SceneDelegate.swift
//  CollectionApp
//
//  Created by pavel on 18.11.21.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        let myWindow = UIWindow(windowScene: windowScene)
        
        let photoVC = PhotoViewController()
        let navigationController = UINavigationController(rootViewController: photoVC)
        
        self.window = myWindow
        myWindow.rootViewController = navigationController
        myWindow.makeKeyAndVisible()
    }
}

