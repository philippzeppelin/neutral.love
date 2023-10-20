//
//  MainAssembly.swift
//  neutral.love
//
//  Created by Sergei Smirnov on 16.10.2023.
//

import UIKit

final class MainAssembly {
    static func configure() -> MainViewController {
        let viewModel = MainViewModel()
        let viewController = MainViewController(viewModel: viewModel)
        return viewController
    }
}
