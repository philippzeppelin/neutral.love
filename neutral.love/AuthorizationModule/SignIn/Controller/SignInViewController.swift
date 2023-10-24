//
//  SignInViewController.swift
//  neutral.love
//
//  Created by Philipp Zeppelin on 21.10.2023.
//

import UIKit

class SignInViewController: UIViewController {
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
        setupAppearence()
        embedView()
        signInViewConstraints()
        setupDelegate()
    }

    private func setupDelegate() {
        signInView.delegate = self
    }
}

private extension SignInViewController {
    func setupAppearence() {
        view.backgroundColor = .systemGray5
    }
}

// MARK: - Setup View and Constraints
private extension SignInViewController {
    func embedView() {
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
        let signUpViewController = SignUpViewController()
        signUpViewController.modalPresentationStyle = .fullScreen
        present(signUpViewController, animated: true)
    }
    
    func signInButtonPressed() {
        print("\(#function) tapped ViewController")
    }
}

extension SignInViewController {
    private enum Constants {
        static let signInViewHeight: CGFloat = 260
        static let signInViewPadding: CGFloat = 43
    }
}
