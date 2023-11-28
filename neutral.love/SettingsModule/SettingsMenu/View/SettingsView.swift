//
//  SettingsView.swift
//  neutral.love
//
//  Created by Philipp Zeppelin on 22.11.2023.
//

import UIKit

protocol SettingsViewDelegate: GeneralSettingsViewDelegate {
    func profileSettingsButtonPressed()
    func themeSettingsButtonPressed()
    func languageSettingsButtonPressed()
}

final class SettingsView: UIView {
    weak var delegate: SettingsViewDelegate? {
        didSet {
            generalSettingsView.delegate = delegate
        }
    }

    private let portraitImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.circle.fill")
        imageView.tintColor = .systemGray4
        imageView.layer.cornerRadius = Constants.portraitImageViewDiameter / 2
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Philipp"
        label.font = Resources.Fonts.arialBold30
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let generalSettingsView = GeneralSettingsView()
    private let aboutUsView = GeneralSettingsView()

    // MARK: Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAppearence()
        embedView()
        setupPortraitImageViewConstraints()
        setupUserNameLabelConstraints()
        setupGeneralSettingsViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Appearence

extension SettingsView {
    private func setupAppearence() {
        backgroundColor = .systemBackground
        translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - Setup Constraints and View

private extension SettingsView {
    func embedView() {
        [
            portraitImageView,
            userNameLabel,
            generalSettingsView
        ].forEach { addSubview($0) }
    }

    func setupPortraitImageViewConstraints() {
        NSLayoutConstraint.activate([
            portraitImageView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            portraitImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            portraitImageView.heightAnchor.constraint(equalToConstant: Constants.portraitImageViewDiameter),
            portraitImageView.widthAnchor.constraint(equalToConstant: Constants.portraitImageViewDiameter)
        ])
    }

    func setupUserNameLabelConstraints() {
        NSLayoutConstraint.activate([
            userNameLabel.topAnchor.constraint(equalTo: portraitImageView.bottomAnchor, constant: 10),
            userNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    func setupGeneralSettingsViewConstraints() {
        NSLayoutConstraint.activate([
            generalSettingsView.heightAnchor.constraint(equalToConstant: 120),
            generalSettingsView.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 15),
            generalSettingsView.leftAnchor.constraint(equalTo: leftAnchor, constant: 25),
            rightAnchor.constraint(equalTo: generalSettingsView.rightAnchor, constant: 25)
        ])
    }
}

// MARK: - Setting Constants

extension SettingsView {
    private enum Constants {
        static let portraitImageViewDiameter: CGFloat = 180
    }
}
