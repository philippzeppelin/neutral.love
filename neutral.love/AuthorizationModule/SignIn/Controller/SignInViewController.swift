//
//  SignInViewController.swift
//  neutral.love
//
//  Created by Philipp Zeppelin on 21.10.2023.
//

import UIKit

class SignInViewController: UIViewController {
    private let signInView = SignInView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setupView()
        signInViewConstraints()
        setupDelegates()
    }

    private func setupDelegates() {
        signInView.delegate = self
    }
}

private extension SignInViewController {
    func configureView() {
        view.backgroundColor = .systemGray5
    }
}

// MARK: - Setup View and Constraints
private extension SignInViewController {
    func setupView() {
        view.addSubview(signInView)
    }

    func signInViewConstraints() {
        NSLayoutConstraint.activate([
            signInView.heightAnchor.constraint(equalToConstant: Constants.signInViewHeight),
            signInView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            signInView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.signInViewPadding),
            view.rightAnchor.constraint(equalTo: signInView.rightAnchor, constant: Constants.signInViewPadding)
        ])
    }
}

// MARK: - SignInViewDelegate
extension SignInViewController: SignInViewDelegate {
    func signUpButtonPressed() {
        print("\(#function) tapped ViewController")
    }
    
    func signInButtonPressed() {
        print("\(#function) tapped ViewController")
    }
}

// TODO: Сделать ассембли

extension SignInViewController {
    private enum Constants {
        static let signInViewHeight: CGFloat = 260
        static let signInViewPadding: CGFloat = 43
    }
}
