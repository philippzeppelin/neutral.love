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
    
    // MARK: - Private constants
    
    private enum UIConstants {
        static let cornerRadius: CGFloat = 10
    }
    
    // MARK: - Static properties
    
    static let identifier = "MainCollectionViewCell"
    
    // MARK: - Private properties
    
    private let generatedImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "photo.on.rectangle.angled")
        image.contentMode = .scaleAspectFit
        image.tintColor = .systemGray2
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // MARK: - Methods
    
    private func configure() {
        contentView.backgroundColor = Resources.Colors.MainModule.mainCollectionCellBackground
        layer.cornerRadius = UIConstants.cornerRadius
        clipsToBounds = true
    }
    
    private func setupViews() {
        contentView.addSubview(generatedImage)
        generatedImage.frame = contentView.frame
    }
}

// MARK: - Set Constraints

extension MainCollectionViewCell {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
        ])
    }
}
