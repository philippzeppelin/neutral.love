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
        textField.placeholder = Resources.Strings.SignInModule.emailText // Перенести в общие стринги
        textField.textColor = .label
        textField.layer.cornerRadius = 10
        textField.addPaddingToTextField()
        textField.backgroundColor = .secondarySystemBackground
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = Resources.Strings.SignInModule.passwordText // Перенести в общие стринги
        textField.textColor = .label
        textField.layer.cornerRadius = 10
        textField.addPaddingToTextField()
        textField.backgroundColor = .secondarySystemBackground
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var signInButton = {
        let button = UIButton()
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.font = Resources.Fonts.arial17
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(hexString: "5B5B93")
        button.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var signUpButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.font = Resources.Fonts.arial17
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(hexString: "5B5B93")
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

    private let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.font = UIFont(name: "Arial", size: 17)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = UIFont(name: "Arial", size: 17)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let dontHaveAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "Don't have an account?"
        label.font = UIFont(name: "Arial", size: 12)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        setupView()
        emailTextFieldConstraints()
        passwordTextFieldConstraints()
        signButtonsStackViewConstraints()
        setupStackView()
        loginLabelConstraints()
        passwordLabelConstraints()
        dontHaveAccountLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupStackView() {
        signButtonsStackView.addArrangedSubview(signInButton)
        signButtonsStackView.addArrangedSubview(signUpButton)
    }

    @objc
    private func signInButtonTapped() {
        print("\(#function) pressed")
        delegate?.signInButtonPressed()
    }

    @objc
    private func signUpButtonTapped() {
        print("\(#function) pressed")
        delegate?.signUpButtonPressed()
    }
}

// MARK: - Configuring View
extension SignInView {
    private func configureView() {
        backgroundColor = .systemGray4
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - Setup View and Constraints
private extension SignInView {
    func setupView() {
        addSubviews(emailTextField,
                    passwordTextField,
                    signButtonsStackView,
                    loginLabel,
                    passwordLabel,
                    dontHaveAccountLabel)
    }

    func emailTextFieldConstraints() {
        NSLayoutConstraint.activate([
            emailTextField.heightAnchor.constraint(equalToConstant: Constants.textFieldsHeight),
            emailTextField.topAnchor.constraint(equalTo: topAnchor, constant: Constants.emailTextFieldTop),
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
            loginLabel.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: Constants.labelsTop),
            loginLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.viewElementsPadding)
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
        static let emailTextFieldTop: CGFloat = 50
        static let viewElementsPadding: CGFloat = 20

        static let elementsHeightWithEachOther: CGFloat = 30
        static let labelsTop: CGFloat = -3
    }
}
