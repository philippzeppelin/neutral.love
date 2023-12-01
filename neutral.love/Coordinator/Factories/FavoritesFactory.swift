//
//  FavoritesFactory.swift
//  neutral.love
//
//  Created by Sergei Smirnov on 10.12.2023.
//

import UIKit

protocol FavoritesFactory {
    func makeFavoritesViewController() -> UIViewController
    func makeItemTabBar(navigation: UINavigationController)
}

struct FavoritesFactoryImp: FavoritesFactory {
    
    func makeFavoritesViewController() -> UIViewController {
        let viewController = FavoritesAssembly.configure()
        viewController.title = Resources.Strings.TabBarModule.favorites
        return viewController
    }
    
    func makeItemTabBar(navigation: UINavigationController) {
        makeItemTabBar(navigation: navigation,
                       title: Resources.Strings.TabBarModule.favorites,
                       image: Resources.Images.TabBarModule.favourites,
                       tag: 1)
    }
}

// MARK: - ItemTabBarFactory

extension FavoritesFactoryImp: ItemTabBarFactory {}
