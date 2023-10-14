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
        
        setup()
    }
    
    private func setup() {
        let favouritesVC = UIViewController()
        let mainVC = UIViewController()
        let settingsVC = UIViewController()
        
        self.viewControllers = [
            generateNavigationController(for: favouritesVC,
                                         title: "",
                                         image: Resources.Images.TabBarModule.main,
                                         selectedImage: Resources.Images.TabBarModule.mainSelected,
                                         tag: 0),
            generateNavigationController(for: mainVC,
                                         title: "",
                                         image: Resources.Images.TabBarModule.pet,
                                         selectedImage: Resources.Images.TabBarModule.petSelected,
                                         tag: 1),
            generateNavigationController(for: settingsVC,
                                         title: "",
                                         image: Resources.Images.TabBarModule.friends,
                                         selectedImage: Resources.Images.TabBarModule.friendsSelected,
                                         tag: 2),
        ]
    }
}

private extension TabBarController {
     func generateNavigationController (for vc: UIViewController, title: String, image: UIImage, selectedImage: UIImage, tag: Int) -> UIViewController {
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem.title = title
        navController.tabBarItem.tag = tag
        navController.tabBarItem.image = image
        navController.tabBarItem.imageInsets = .init(top: 10, left: 0, bottom: 0, right: 0)
        navController.tabBarItem.selectedImage = selectedImage
        return navController
    }
}
