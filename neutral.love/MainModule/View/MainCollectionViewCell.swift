//
//  MainCollectionViewCell.swift
//  neutral.love
//
//  Created by Sergei Smirnov on 17.10.2023.
//

import UIKit

final class MainCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private properties
    
    private let generatedImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "photo.on.rectangle.angled")
        image.contentMode = .scaleAspectFit
        image.tintColor = .systemGray2
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
}

// MARK: - Set Constraints

extension MainCollectionViewCell {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
        ])
    }
}

// MARK: - Configure

extension MainCollectionViewCell {
    
    private func configure() {
        contentView.backgroundColor = Resources.Colors.MainModule.mainCollectionCellBackground
        layer.cornerRadius = Constants.cornerRadius
        clipsToBounds = true
    }
}

// MARK: - SetupViews

extension MainCollectionViewCell {
    
    private func setupViews() {
        contentView.addSubview(generatedImage)
        generatedImage.frame = contentView.frame
    }
}

// MARK: - Constants

extension MainCollectionViewCell {
    
    private enum Constants {
        static let cornerRadius: CGFloat = 10
    }
}

extension String {
    static let MainCollectionViewCellIdentifier = "MainCollectionViewCell"
}
