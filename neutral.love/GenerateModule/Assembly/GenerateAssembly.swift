//
//  GenerateAssembly.swift
//  neutral.love
//
//  Created by Sergei Smirnov on 21.10.2023.
//

import UIKit

final class GenerateAssembly {
    static func configure() -> GenerateViewController {
        let viewModel = GenerateViewModel()
        let viewController = GenerateViewController(viewModel: viewModel)
        return viewController
    }
}
