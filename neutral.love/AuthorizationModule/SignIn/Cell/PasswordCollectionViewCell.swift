//
//  PasswordCollectionViewCell.swift
//  neutral.love
//
//  Created by Philipp Zeppelin on 18.10.2023.
//

import UIKit

final class PasswordCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "PasswordCollectionViewCell"
    private let passwordTextField = AuthTextField(placeholder: "******") // TODO: Перекинуть в глобальные константы

    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Constants
extension PasswordCollectionViewCell {
    private func setupView() {
        contentView.addSubview(passwordTextField)
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: topAnchor),
            passwordTextField.leftAnchor.constraint(equalTo: leftAnchor),
            passwordTextField.leftAnchor.constraint(equalTo: leftAnchor),
            passwordTextField.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension PasswordCollectionViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        passwordTextField.resignFirstResponder()
        return true
    }
}
