//
//  FavoritesViewController.swift
//  neutral.love
//
//  Created by Philipp Zeppelin on 13.11.2023.
//

import UIKit

final class FavoritesViewController: UIViewController {
    private let favoritesView = FavoritesView()
    private let viewModel: FavoritesViewModel

    override func viewDidLoad() {
        super.viewDidLoad()
        embedView()
        setupfavoritesViewConstraints()
    }

    init(viewModel: FavoritesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension FavoritesViewController {
    func embedView() {
        view.addSubview(favoritesView)
    }

    func setupfavoritesViewConstraints() {
        NSLayoutConstraint.activate([
            favoritesView.topAnchor.constraint(equalTo: view.topAnchor),
            favoritesView.leftAnchor.constraint(equalTo: view.leftAnchor),
            favoritesView.rightAnchor.constraint(equalTo: view.rightAnchor),
            favoritesView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
