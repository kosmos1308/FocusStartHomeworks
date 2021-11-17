//
//  SceneDelegate.swift
//  cv
//
//  Created by pavel on 13.11.21.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?    

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let myWindow = UIWindow(windowScene: windowScene)
        self.window = myWindow
        myWindow.rootViewController = TabBarController()
        myWindow.makeKeyAndVisible()
    }
}

