//
//  SceneDelegate.swift
//  neutral.love
//
//  Created by Philipp Zeppelin on 05.10.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = SignInAssembly.configure()
        window.makeKeyAndVisible()
        self.window = window
    }
}
