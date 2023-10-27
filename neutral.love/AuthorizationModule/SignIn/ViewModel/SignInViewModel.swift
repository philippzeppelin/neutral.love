//
//  SignInViewModel.swift
//  neutral.love
//
//  Created by Philipp Zeppelin on 19.10.2023.
//

import Foundation

protocol SignInViewModelProtocol {
    func signIn()
}

final class SignInViewModel: SignInViewModelProtocol {

    // MARK: Init
    init() {}

    public func signIn() {
        print("Sign In View Model")
    }
}
