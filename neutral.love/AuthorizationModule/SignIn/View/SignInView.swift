//
//  SignInView.swift
//  neutral.love
//
//  Created by Philipp Zeppelin on 21.10.2023.
//

import UIKit

protocol SignInViewDelegate: AnyObject {
    func signInButtonPressed()
    func signUpButtonPressed()
}

class SignInView: UIView {
    weak var delegate: SignInViewDelegate?

    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = Resources.Strings.SignInModule.emailText
        textField.textColor = .label
        textField.layer.cornerRadius = Constants.elementsCornerRadius
        textField.addPaddingToTextField()
        textField.backgroundColor = .secondarySystemBackground
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = Resources.Strings.SignInModule.passwordAsterisksText
        textField.textColor = .label
        textField.layer.cornerRadius = Constants.elementsCornerRadius
        textField.addPaddingToTextField()
        textField.backgroundColor = .secondarySystemBackground
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var signInButton = {
        let button = UIButton()
        button.setTitle(Resources.Strings.SignInModule.signInButtonText, for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.font = Resources.Fonts.SignInModule.arial17
        button.layer.cornerRadius = Constants.elementsCornerRadius
        button.backgroundColor = Resources.Colors.SignInModule.signButtonsColor
        button.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var signUpButton = {
        let button = UIButton()
        button.setTitle(Resources.Strings.SignInModule.signUpButtonText, for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.font = Resources.Fonts.SignInModule.arial17
        button.layer.cornerRadius = Constants.elementsCornerRadius
        button.backgroundColor = Resources.Colors.SignInModule.signButtonsColor
        button.addTarget(nil, action: #selector(signUpButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let signButtonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = Resources.Strings.SignInModule.emailText
        label.font = Resources.Fonts.SignInModule.arial17
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = Resources.Strings.SignInModule.passwordText
        label.font = Resources.Fonts.SignInModule.arial17
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let dontHaveAccountLabel: UILabel = {
        let label = UILabel()
        label.text = Resources.Strings.SignInModule.dontHaveAnAccountText
        label.font = Resources.Fonts.SignInModule.arial12
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAppearence()
        embedViews()
        emailTextFieldConstraints()
        passwordTextFieldConstraints()
        signButtonsStackViewConstraints()
        addingButtonsToStackView()
        loginLabelConstraints()
        passwordLabelConstraints()
        dontHaveAccountLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addingButtonsToStackView() {
        signButtonsStackView.addArrangedSubview(signInButton)
        signButtonsStackView.addArrangedSubview(signUpButton)
    }

    @objc
    private func signInButtonTapped() {
        delegate?.signInButtonPressed()
    }

    @objc
    private func signUpButtonTapped() {
        delegate?.signUpButtonPressed()
    }
}

// MARK: - Configuring View
extension SignInView {
    private func setupAppearence() {
        backgroundColor = .systemGray4
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - Setup View and Constraints
private extension SignInView {
    func embedViews() {
        [emailTextField,
         passwordTextField,
         signButtonsStackView,
         emailLabel,
         passwordLabel,
         dontHaveAccountLabel].forEach { addSubview($0) }
    }

    func emailTextFieldConstraints() {
        NSLayoutConstraint.activate([
            emailTextField.heightAnchor.constraint(equalToConstant: Constants.textFieldsHeight),
            emailTextField.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            emailTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.viewElementsPadding),
            rightAnchor.constraint(equalTo: emailTextField.rightAnchor, constant: Constants.viewElementsPadding)
        ])
    }

    func passwordTextFieldConstraints() {
        NSLayoutConstraint.activate([
            passwordTextField.heightAnchor.constraint(equalToConstant: Constants.textFieldsHeight),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: Constants.elementsHeightWithEachOther),
            passwordTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.viewElementsPadding),
            rightAnchor.constraint(equalTo: passwordTextField.rightAnchor, constant: Constants.viewElementsPadding)
        ])
    }

    func signButtonsStackViewConstraints() {
        NSLayoutConstraint.activate([
            signButtonsStackView.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: Constants.elementsHeightWithEachOther),
            signButtonsStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.viewElementsPadding),
            rightAnchor.constraint(equalTo: signButtonsStackView.rightAnchor, constant: Constants.viewElementsPadding)
        ])
    }

    func loginLabelConstraints() {
        NSLayoutConstraint.activate([
            emailLabel.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: Constants.labelsTop),
            emailLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.viewElementsPadding)
        ])
    }

    func passwordLabelConstraints() {
        NSLayoutConstraint.activate([
            passwordLabel.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: Constants.labelsTop),
            passwordLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.viewElementsPadding)
        ])
    }

    func dontHaveAccountLabelConstraints() {
        NSLayoutConstraint.activate([
            dontHaveAccountLabel.bottomAnchor.constraint(equalTo: signUpButton.topAnchor, constant: Constants.labelsTop),
            dontHaveAccountLabel.leftAnchor.constraint(equalTo: signUpButton.leftAnchor)
        ])
    }
}

// MARK: - Setting Constants
extension SignInView {
    private enum Constants {
        static let textFieldsHeight: CGFloat = 40
        static let viewElementsPadding: CGFloat = 20
        static let elementsHeightWithEachOther: CGFloat = 30
        static let labelsTop: CGFloat = -3
        static let elementsCornerRadius: CGFloat = 10
    }
}
