//
//  SignInAuthViewModel.swift
//  neutral.love
//
//  Created by Philipp Zeppelin on 19.10.2023.
//

import Foundation

final class SignInAuthViewModel {
    enum AuthState {
        case signIn
        case signUp
    }

    private let signInVC: SignInViewController

    private var emailText = ""
    private var passwordText = ""

    init(signInVC: SignInViewController, 
         emailText: String = "",
         passwordText: String = "") {
        self.signInVC = signInVC
        self.emailText = emailText
        self.passwordText = passwordText
    }
}
