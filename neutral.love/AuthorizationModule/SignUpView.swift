//
//  SignUpView.swift
//  neutral.love
//
//  Created by Philipp Zeppelin on 27.10.2023.
//

import UIKit

protocol SignUpViewDelegate: AnyObject {
    func signUpButtonPressed()
    func backButtonPressed()
}
// TODO: Add Labels
/// View for hosting SignUp UI elements
final class SignUpView: UIView {
    weak var delegate: SignUpViewDelegate?

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let signUpView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let nameTextField = AuthTextField(placeholder: "Name")
    private let emailTextField = AuthTextField(placeholder: "Email")
    private let passwordTextField = AuthTextField(placeholder: "Password")

    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.font = Resources.Fonts.SignInModule.arial17
        button.layer.cornerRadius = 10
        button.backgroundColor = Resources.Colors.SignInModule.signButtonsColor
        button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.font = Resources.Fonts.SignInModule.arial17
        button.layer.cornerRadius = 10
        button.backgroundColor = Resources.Colors.SignInModule.signButtonsColor
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = Resources.Strings.SignInModule.nameText
        label.font = Resources.Fonts.SignInModule.arial17
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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

    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAppearence()
        setupDelegates()
        embedView()
        setupScrollViewConstraints()
        setupBackgroundViewConstraints()
        setupSignUpViewConstraints()
        setupNameTextFieldConstraints()
        setupEmailTextFieldConstraints()
        setupPasswordTextFieldConstraints()
        setupSignUpButtonConstraints()
        setupBackButtonConstraints()
        registerKeyBoardNotification()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        removeKeyboardNotification()
    }

    @objc
    private func signUpButtonTapped() {
        delegate?.signUpButtonPressed()
    }

    @objc
    private func backButtonTapped() {
        delegate?.backButtonPressed()
    }

    private func setupDelegates() {
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
}

// MARK: - UITextFieldDelegate
extension SignUpView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }
}

// MARK: - Offset content
private extension SignUpView {
    func registerKeyBoardNotification() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }

    @objc
    func keyboardWillShow(notification: Notification) {
        let userInfo = notification.userInfo

        guard let keyboardHeight = (
            userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
        )?.cgRectValue else {
            return
        }

        scrollView.contentOffset = CGPoint(x: 0, y: keyboardHeight.height / 2.5)
    }

    @objc
    func keyboardWillHide(notification: Notification) {
        scrollView.contentOffset = CGPoint.zero
    }

    func removeKeyboardNotification() {
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )

        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
}

// MARK: - Setup View
extension SignUpView {
    private func setupAppearence() {
        backgroundColor = .systemGray5
        translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - Setup UI elements and constraints
private extension SignUpView {
    func embedView() {
        addSubview(scrollView)
        scrollView.addSubview(backgroundView)
        backgroundView.addSubview(signUpView)

        [
            nameTextField,
            emailTextField,
            passwordTextField,
            signUpButton,
            backButton,
            nameLabel,
            emailLabel,
            passwordLabel
        ].forEach { signUpView.addSubview($0) }
    }

    func setupScrollViewConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leftAnchor.constraint(equalTo: leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    func setupBackgroundViewConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            backgroundView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            backgroundView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            backgroundView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }

    func setupSignUpViewConstraints() {
        NSLayoutConstraint.activate([
            signUpView.heightAnchor.constraint(equalToConstant: 420),
            signUpView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),
            signUpView.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: Constants.signUpViewPadding),
            backgroundView.rightAnchor.constraint(equalTo: signUpView.rightAnchor, constant: Constants.signUpViewPadding)
        ])
    }

    func setupNameTextFieldConstraints() {
        NSLayoutConstraint.activate([
            nameTextField.heightAnchor.constraint(equalToConstant: Constants.uiElementsHeight),
            nameTextField.topAnchor.constraint(equalTo: signUpView.topAnchor, constant: 50),
            nameTextField.leftAnchor.constraint(equalTo: signUpView.leftAnchor, constant: Constants.uiElementsPadding),
            signUpView.rightAnchor.constraint(equalTo: nameTextField.rightAnchor, constant: Constants.uiElementsPadding)
        ])
    }

    func setupEmailTextFieldConstraints() {
        NSLayoutConstraint.activate([
            emailTextField.heightAnchor.constraint(equalToConstant: Constants.uiElementsHeight),
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: Constants.uielementsHeightWithEachOther),
            emailTextField.leftAnchor.constraint(equalTo: signUpView.leftAnchor, constant: Constants.uiElementsPadding),
            signUpView.rightAnchor.constraint(equalTo: emailTextField.rightAnchor, constant: Constants.uiElementsPadding)
        ])
    }

    func setupPasswordTextFieldConstraints() {
        NSLayoutConstraint.activate([
            passwordTextField.heightAnchor.constraint(equalToConstant: Constants.uiElementsHeight),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: Constants.uielementsHeightWithEachOther),
            passwordTextField.leftAnchor.constraint(equalTo: signUpView.leftAnchor, constant: Constants.uiElementsPadding),
            signUpView.rightAnchor.constraint(equalTo: passwordTextField.rightAnchor, constant: Constants.uiElementsPadding)
        ])
    }

    func setupSignUpButtonConstraints() {
        NSLayoutConstraint.activate([
            signUpButton.heightAnchor.constraint(equalToConstant: Constants.uiElementsHeight),
            signUpButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: Constants.uielementsHeightWithEachOther),
            signUpButton.centerXAnchor.constraint(equalTo: signUpView.centerXAnchor),
            signUpButton.leftAnchor.constraint(equalTo: signUpView.leftAnchor, constant: Constants.uiElementsPadding),
            signUpView.rightAnchor.constraint(equalTo: signUpButton.rightAnchor, constant: Constants.uiElementsPadding)
        ])
    }

    func setupBackButtonConstraints() {
        NSLayoutConstraint.activate([
            backButton.heightAnchor.constraint(equalToConstant: Constants.uiElementsHeight),
            backButton.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: Constants.uielementsHeightWithEachOther),
            backButton.centerXAnchor.constraint(equalTo: signUpView.centerXAnchor),
            backButton.leftAnchor.constraint(equalTo: signUpView.leftAnchor, constant: Constants.backButtonPadding),
            signUpView.rightAnchor.constraint(equalTo: backButton.rightAnchor, constant: Constants.backButtonPadding)
        ])
    }

    func setupNameLabelConstraints() {
        nameLabel.topAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>, constant: <#T##CGFloat#>)
    }
}

extension SignUpView {
    private enum Constants {
        static let uiElementsHeight: CGFloat = 40
        static let signUpViewPadding: CGFloat = 43
        static let uiElementsPadding: CGFloat = 20
        static let uielementsHeightWithEachOther: CGFloat = 30
        static let backButtonPadding: CGFloat = 75
    }
}
