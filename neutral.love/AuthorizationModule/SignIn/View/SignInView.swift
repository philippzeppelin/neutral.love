//
//  SignInView.swift
//  neutral.love
//
//  Created by Philipp Zeppelin on 21.10.2023.
//

import UIKit

class SignInView: UIView {
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email" // Перенести в общие стринги
        textField.textColor = .label
        textField.layer.cornerRadius = 10
        textField.addPaddingToTextField()
        textField.backgroundColor = .secondarySystemBackground
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "******" // Перенести в общие стринги
        textField.textColor = .label
        textField.layer.cornerRadius = 10
        textField.addPaddingToTextField()
        textField.backgroundColor = .secondarySystemBackground
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let signInButton = {
        let button = UIButton()
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.font = UIFont(name: "Arial", size: 17)
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(hexString: "5B5B93")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let signUpButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.font = UIFont(name: "Arial", size: 17)
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(hexString: "5B5B93")
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
}

extension SignInView {
    private func configureView() {
        backgroundColor = .systemGray4
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
    }
}

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
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            emailTextField.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            emailTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            emailTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -20)
        ])
    }

    func passwordTextFieldConstraints() {
        NSLayoutConstraint.activate([
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30),
            passwordTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            passwordTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -20)
        ])
    }

    func signButtonsStackViewConstraints() {
        NSLayoutConstraint.activate([
            signButtonsStackView.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            signButtonsStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            signButtonsStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20)
        ])
    }

    func loginLabelConstraints() {
        NSLayoutConstraint.activate([
            loginLabel.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -3),
            loginLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20)
        ])
    }

    func passwordLabelConstraints() {
        NSLayoutConstraint.activate([
            passwordLabel.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -3),
            passwordLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20)
        ])
    }

    func dontHaveAccountLabelConstraints() {
        NSLayoutConstraint.activate([
            dontHaveAccountLabel.bottomAnchor.constraint(equalTo: signUpButton.topAnchor, constant: -3),
            dontHaveAccountLabel.leftAnchor.constraint(equalTo: signUpButton.leftAnchor)
        ])
    }
}
