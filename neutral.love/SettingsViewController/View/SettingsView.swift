//
//  SettingsView.swift
//  neutral.love
//
//  Created by Philipp Zeppelin on 22.11.2023.
//

import UIKit

final class SettingsView: UIView {
    private let portraitImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.circle.fill")
        imageView.tintColor = .systemGray4
        imageView.layer.cornerRadius = Constants.portraitImageViewDiameter / 2
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Ivan"
        label.font = Resources.Fonts.arialBold30
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let emailTextField = CustomTextField(placeholder: "Email")
    private let passwordTextField = CustomTextField(placeholder: "Password")

    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = Resources.Strings.AuthorizationModule.emailText
        label.font = Resources.Fonts.arial17
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = Resources.Strings.AuthorizationModule.passwordText
        label.font = Resources.Fonts.arial17
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAppearence()
        embedView()
        setupPortraitImageViewConstraints()
        setupUserNameLabelConstraints()
        setupEmailTextFieldConstraints()
        setupPasswordTextFieldConstraints()
        setupEmailLabelConstraints()
        setupPasswordLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Appearence

extension SettingsView {
    private func setupAppearence() {
        backgroundColor = .systemGray5
        translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - Setup Constraints and View

private extension SettingsView {
    func embedView() {
        [
            portraitImageView,
            userNameLabel,
            emailTextField,
            passwordTextField,
            emailLabel,
            passwordLabel
        ].forEach { addSubview($0) }
    }

    func setupPortraitImageViewConstraints() {
        NSLayoutConstraint.activate([
            portraitImageView.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            portraitImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            portraitImageView.heightAnchor.constraint(equalToConstant: Constants.portraitImageViewDiameter),
            portraitImageView.widthAnchor.constraint(equalToConstant: Constants.portraitImageViewDiameter)
        ])
    }

    func setupUserNameLabelConstraints() {
        NSLayoutConstraint.activate([
            userNameLabel.topAnchor.constraint(equalTo: portraitImageView.bottomAnchor, constant: 10),
            userNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    func setupEmailTextFieldConstraints() {
        NSLayoutConstraint.activate([
            emailTextField.heightAnchor.constraint(equalToConstant: Constants.uiElementsHeight),
            emailTextField.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: Constants.uiElementsHeightWithEachOther),
            emailTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.uiElementsPadding),
            rightAnchor.constraint(equalTo: emailTextField.rightAnchor, constant: Constants.uiElementsPadding)
        ])
    }

    func setupPasswordTextFieldConstraints() {
        NSLayoutConstraint.activate([
            passwordTextField.heightAnchor.constraint(equalToConstant: Constants.uiElementsHeight),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: Constants.uiElementsHeightWithEachOther),
            passwordTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.uiElementsPadding),
            rightAnchor.constraint(equalTo: passwordTextField.rightAnchor, constant: Constants.uiElementsPadding)
        ])
    }

    func setupEmailLabelConstraints() {
        NSLayoutConstraint.activate([
            emailLabel.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: Constants.labelsTop),
            emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.uiElementsPadding)
        ])
    }

    func setupPasswordLabelConstraints() {
        NSLayoutConstraint.activate([
            passwordLabel.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: Constants.labelsTop),
            passwordLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.uiElementsPadding)
        ])
    }
}

// MARK: - Setting Constants

extension SettingsView {
    private enum Constants {
        static let portraitImageViewDiameter: CGFloat = 180
        static let uiElementsHeightWithEachOther: CGFloat = 30
        static let uiElementsHeight: CGFloat = 40
        static let uiElementsPadding: CGFloat = 20
        static let labelsTop: CGFloat = -3

    }
}
