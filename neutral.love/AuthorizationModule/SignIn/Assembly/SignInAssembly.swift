//
//  SignInAssembly.swift
//  neutral.love
//
//  Created by Philipp Zeppelin on 24.10.2023.
//

import Foundation

final class SignInAssembly {
    static func configure() -> SignInViewController {
        let viewModel = SignInViewModel()
        let viewController = SignInViewController(viewModel: viewModel)
        return viewController
    }
}
