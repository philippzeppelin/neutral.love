//
//  FavoritesCell.swift
//  neutral.love
//
//  Created by Philipp Zeppelin on 13.11.2023.
//

import UIKit

class FavoritesCell: UICollectionViewCell {
    static let cellIdentifier = "FavoritesCell"

    private let savedImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        embedView()
        setupSavedImageConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup View and Constraints
private extension FavoritesCell {
    func embedView() {
        contentView.addSubview(savedImage)
    }

    func setupSavedImageConstraints() {
        NSLayoutConstraint.activate([
            savedImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            savedImage.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            savedImage.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            savedImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
