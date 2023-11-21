//
//  SignInViewController.swift
//  neutral.love
//
//  Created by Philipp Zeppelin on 21.10.2023.
//

import UIKit

final class SignInViewController: UIViewController {
    private let signInView = SignInView()
    private let viewModel: SignInViewModelProtocol

    init(viewModel: SignInViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        embedView()
        setupConstraints()
        setupDelegate()
    }

    private func setupDelegate() {
        signInView.delegate = self
    }
}

// MARK: - Setup View and Constraints
private extension SignInViewController {
    func embedView() {
        view.addSubview(signInView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            signInView.topAnchor.constraint(equalTo: view.topAnchor),
            signInView.leftAnchor.constraint(equalTo: view.leftAnchor),
            signInView.rightAnchor.constraint(equalTo: view.rightAnchor),
            signInView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - SignInViewDelegate
extension SignInViewController: SignInViewDelegate {
    func signUpButtonPressed() {
        let signUpViewController = SignUpViewController(viewModel: SignUpViewModel())
        signUpViewController.modalPresentationStyle = .fullScreen
        present(signUpViewController, animated: true)
    }
    
    func signInButtonPressed() {
        let mainViewController = MainViewController(viewModel: MainViewModel())
        mainViewController.modalPresentationStyle = .fullScreen
        present(mainViewController, animated: true)
    }
}
