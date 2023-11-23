//
//  SettingsViewController.swift
//  neutral.love
//
//  Created by Philipp Zeppelin on 20.11.2023.
//

import UIKit

class SettingsViewController: UIViewController {
    private let viewModel: SettingsViewModel

    private let settingsView = SettingsView()

    override func viewDidLoad() {
        super.viewDidLoad()
        embedView()
        setupSettingsViewConstraints()
    }

    init(viewModel: SettingsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension SettingsViewController {
    func embedView() {
        view.addSubview(settingsView)
    }

    func setupSettingsViewConstraints() {
        NSLayoutConstraint.activate([
            settingsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            settingsView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            settingsView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            settingsView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
