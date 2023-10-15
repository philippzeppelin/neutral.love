//
//  AuthTextField.swift
//  neutral.love
//
//  Created by Philipp Zeppelin on 15.10.2023.
//

import UIKit

class AuthTextField: UITextField {

    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(placeholder: String) {
        self.init(frame: .zero)

        let attribute = [NSAttributedString.Key.foregroundColor: UIColor.systemGreen]
        let placeholderText = NSAttributedString(string: placeholder, attributes: attribute)

        attributedPlaceholder = placeholderText
    }

    private func configureTextField() {
        backgroundColor = .systemYellow
//        borderStyle = .line
        translatesAutoresizingMaskIntoConstraints = false
    }
}
