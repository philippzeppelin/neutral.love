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
            signInView.heightAnchor.constraint(equalToConstant: 260),
            signInView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            signInView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 43),
            signInView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -43)
        ])
    }
}
