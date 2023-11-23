//
//  TabBarController.swift
//  neutral.love
//
//  Created by Sergei Smirnov on 14.10.2023.
//

import UIKit

final class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        createTabBar()
        setupTabBar()
    }

    private func createTabBar() {
        let favoritesVC = FavoritesViewController(viewModel: FavoritesViewModel())
        let mainVC = MainViewController(viewModel: MainViewModel())
        let settingsVC = SettingsViewController(viewModel: SettingsViewModel())

        setViewControllers([
            generateNavigationController(
                for: favoritesVC, title: "Favorites",
                image: Resources.Images.TabBarModule.favourities,
                tag: 1
            ),

            generateNavigationController(
                for: mainVC, title: "Generate",
                image: Resources.Images.TabBarModule.main,
                tag: 2
            ),
            
            generateNavigationController(
                for: settingsVC, title: "Settings",
                image: Resources.Images.TabBarModule.settings,
                tag: 3
            )
        ],
                           animated: true)
    }
}

private extension TabBarController {
    func generateNavigationController(
        for viewController: UIViewController,
        title: String,
        image: UIImage,
        tag: Int
    ) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        viewController.title = title
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.scrollEdgeAppearance = navigationController.navigationBar.standardAppearance
        navigationController.tabBarItem = UITabBarItem(
            title: title,
            image: image,
            tag: tag
        )

        return navigationController
    }

    func setupTabBar() {
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 14
        let widht = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2

        let roundLayer = CAShapeLayer()

        let rect = CGRect(
            x: positionOnX,
            y: tabBar.bounds.minY - positionOnY,
            width: widht,
            height: height
        )
        let bezierPath = UIBezierPath(
            roundedRect: rect,
            cornerRadius: height / 4
        )

        roundLayer.path = bezierPath.cgPath
        roundLayer.fillColor = Resources.Colors.TabBarModule.tabBarFillColor.cgColor

        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.itemWidth = widht / 3
        tabBar.itemPositioning = .centered
        tabBar.tintColor = Resources.Colors.TabBarModule.tabBarTintColor
        tabBar.unselectedItemTintColor = Resources.Colors.TabBarModule.tabBarUnselectedItem
    }
}
