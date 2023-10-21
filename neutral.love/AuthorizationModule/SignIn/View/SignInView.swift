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
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "******" // Перенести в общие стринги
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SignInView {
    private func configureView() {
        backgroundColor = .red
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
    }
}
