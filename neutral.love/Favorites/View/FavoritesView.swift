//
//  FavoritesView.swift
//  neutral.love
//
//  Created by Philipp Zeppelin on 13.11.2023.
//

import UIKit

final class FavoritesView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAppearence()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FavoritesView {
    private func setupAppearence() {
        backgroundColor = .red
        translatesAutoresizingMaskIntoConstraints = false
    }
}
