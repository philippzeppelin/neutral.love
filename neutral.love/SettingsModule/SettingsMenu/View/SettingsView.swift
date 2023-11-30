//
//  SettingsView.swift
//  neutral.love
//
//  Created by Philipp Zeppelin on 22.11.2023.
//

import UIKit

protocol SettingsViewDelegate: GeneralSettingsViewDelegate, AboutUsViewDelegate {
    func profileSettingsButtonPressed()
    func themeSettingsButtonPressed()
    func languageSettingsButtonPressed()

    func projectLinkButtonPressed()
    func philippLinkButtonPressed()
    func sergeyLinkButtonPressed()
}

final class SettingsView: UIView {
    weak var settingsViewDelegate: SettingsViewDelegate? {
        didSet {
            generalSettingsView.delegate = settingsViewDelegate
            aboutUsView.delegate = settingsViewDelegate
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
    private let aboutUsView = AboutUsView()

    private let aboutUsLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.arial17
        label.textColor = .label
        label.text = "About us"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAppearence()
        embedView()
        setupPortraitImageViewConstraints()
        setupUserNameLabelConstraints()
        setupGeneralSettingsViewConstraints()
        setupAboutUsViewConstraints()
        setupAboutUsLabel()
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
            generalSettingsView,
            aboutUsView,
            aboutUsLabel
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
            generalSettingsView.heightAnchor.constraint(equalToConstant: Constants.settingsViewHeight),
            generalSettingsView.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 15),
            generalSettingsView.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.settingsViewPadding),
            rightAnchor.constraint(equalTo: generalSettingsView.rightAnchor, constant: Constants.settingsViewPadding)
        ])
    }

    func setupAboutUsViewConstraints() {
        NSLayoutConstraint.activate([
            aboutUsView.heightAnchor.constraint(equalToConstant: Constants.settingsViewHeight),
            aboutUsView.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.settingsViewPadding),
            rightAnchor.constraint(equalTo: aboutUsView.rightAnchor, constant: Constants.settingsViewPadding),
            aboutUsView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -35)
        ])
    }

    func setupAboutUsLabel() {
        NSLayoutConstraint.activate([
            aboutUsLabel.bottomAnchor.constraint(equalTo: aboutUsView.topAnchor, constant: -3),
            aboutUsLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.aboutUsLabelLeftPadding)
        ])
    }
}

// MARK: - Setting Constants

extension SettingsView {
    private enum Constants {
        static let portraitImageViewDiameter: CGFloat = 180
        static let settingsViewPadding: CGFloat = 25
        static let settingsViewHeight: CGFloat = 120
        static let aboutUsLabelLeftPadding = Constants.settingsViewPadding + 5
    }
}
