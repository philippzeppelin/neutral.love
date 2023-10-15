//
//  EmailCollectionViewCell.swift
//  neutral.love
//
//  Created by Philipp Zeppelin on 15.10.2023.
//

import UIKit

class EmailCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "EmailCollectionViewCell"
    let emailTextField = AuthTextField(placeholder: "Email")

    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupDelegate() {
        emailTextField.delegate = self
    }
}

// MARK: - Constraints
private extension EmailCollectionViewCell {
    func setupView() {
        contentView.addSubview(emailTextField)
    }

    func addConstraints() {
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: topAnchor),
            emailTextField.leftAnchor.constraint(equalTo: leftAnchor),
            emailTextField.rightAnchor.constraint(equalTo: rightAnchor),
            emailTextField.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

// MARK: - UITextFieldDelegate
extension EmailCollectionViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
        return true
    }
}
