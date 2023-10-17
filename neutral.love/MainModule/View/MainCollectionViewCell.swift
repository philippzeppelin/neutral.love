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
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private properties
    
    static let identifier = "MainInfoCell"
    
    // MARK: - Methods
    
    private func setupViews() {
        contentView.backgroundColor = Resources.Colors.MainModule.mainCollectionCellBackground
//        contentView.addSubview(background)
    }
    
    private func setConstraints() {
        
    }
}
