//
//  GeneralSettingsView.swift
//  neutral.love
//
//  Created by Philipp Zeppelin on 27.11.2023.
//

import UIKit

protocol GeneralSettingsViewDelegate: AnyObject {
    func profileSettingsButtonPressed()
    func themeSettingsButtonPressed()
    func languageSettingsButtonPressed()
}

final class GeneralSettingsView: UIView {
    weak var delegate: GeneralSettingsViewDelegate?

    private let firstDividerView = DividerView()
    private let secondDividerView = DividerView()

    private let profileSettingsView1 = UIView()
    private let profileSettingsView2 = UIView()
    private let profileSettingsView3 = UIView()

    private let viewsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 1
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let profileSettingsButton = UIButton()
    private let themeSettingsButton = UIButton()
    private let languageSettingsButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAppearence()
        embedView()

        setupViewsStackView()
        setupProfileSettingsButton()
        setupThemeSettingsButton()
        setupLanguageSettingsButton()

        setupDividersConstraints()
        setupDividersStackViewConstraints()
        setupProfileSettingsButtonConstraints()
        setupThemeSettingsButtonConstraints()
        setupLanguageSettingsButtonConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViewsStackView() {
            viewsStackView.addArrangedSubview(profileSettingsView1)
            viewsStackView.addArrangedSubview(profileSettingsView2)
            viewsStackView.addArrangedSubview(profileSettingsView3)
        }

    private func setupProfileSettingsButton() {
        profileSettingsButton.setTitle("Profile settings", for: .normal)
        profileSettingsButton.titleLabel?.font = Resources.Fonts.arial17
        profileSettingsButton.setTitleColor(.label, for: .normal)
        profileSettingsButton.contentHorizontalAlignment = .left
        profileSettingsButton.addTarget(self, action: #selector(profileSettingsButtonPressed), for: .touchUpInside)
        profileSettingsButton.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupThemeSettingsButton() {
        themeSettingsButton.setTitle("Theme", for: .normal)
        themeSettingsButton.titleLabel?.font = Resources.Fonts.arial17
        themeSettingsButton.setTitleColor(.label, for: .normal)
        themeSettingsButton.contentHorizontalAlignment = .left
        themeSettingsButton.addTarget(self, action: #selector(themeSettingsButtonPressed), for: .touchUpInside)
        themeSettingsButton.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupLanguageSettingsButton() {
        languageSettingsButton.setTitle("Language", for: .normal)
        languageSettingsButton.titleLabel?.font = Resources.Fonts.arial17
        languageSettingsButton.setTitleColor(.label, for: .normal)
        languageSettingsButton.contentHorizontalAlignment = .left
        languageSettingsButton.addTarget(self, action: #selector(languageSettingsButtonPressed), for: .touchUpInside)
        languageSettingsButton.translatesAutoresizingMaskIntoConstraints = false
    }

    @objc
    private func profileSettingsButtonPressed() {
        delegate?.profileSettingsButtonPressed()
    }

    @objc
    private func themeSettingsButtonPressed() {
        delegate?.themeSettingsButtonPressed()
    }

    @objc
    private func languageSettingsButtonPressed() {
        delegate?.languageSettingsButtonPressed()
    }
}

// MARK: - Setup Appearence

extension GeneralSettingsView {
    private func setupAppearence() {
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - Setup Constraints and View

private extension GeneralSettingsView {
    func embedView() {
        [
            viewsStackView,
            firstDividerView,
            secondDividerView
        ].forEach { addSubview($0) }

        profileSettingsView1.addSubview(profileSettingsButton)
        profileSettingsView2.addSubview(themeSettingsButton)
        profileSettingsView3.addSubview(languageSettingsButton)
    }

    func setupDividersConstraints() {
        NSLayoutConstraint.activate([
            firstDividerView.topAnchor.constraint(equalTo: profileSettingsView1.bottomAnchor),
            firstDividerView.leftAnchor.constraint(equalTo: leftAnchor),
            firstDividerView.rightAnchor.constraint(equalTo: rightAnchor),
            firstDividerView.bottomAnchor.constraint(equalTo: profileSettingsView2.topAnchor),

            secondDividerView.topAnchor.constraint(equalTo: profileSettingsView2.bottomAnchor),
            secondDividerView.leftAnchor.constraint(equalTo: leftAnchor),
            secondDividerView.rightAnchor.constraint(equalTo: rightAnchor),
            secondDividerView.bottomAnchor.constraint(equalTo: profileSettingsView3.topAnchor)
        ])
    }

    func setupDividersStackViewConstraints() {
        NSLayoutConstraint.activate([
            viewsStackView.topAnchor.constraint(equalTo: topAnchor),
            viewsStackView.leftAnchor.constraint(equalTo: leftAnchor),
            viewsStackView.rightAnchor.constraint(equalTo: rightAnchor),
            viewsStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    func setupProfileSettingsButtonConstraints() {
        NSLayoutConstraint.activate([
            profileSettingsButton.centerYAnchor.constraint(equalTo: profileSettingsView1.centerYAnchor),
            profileSettingsButton.leftAnchor.constraint(equalTo: profileSettingsView1.leftAnchor, constant: Constants.buttonsLeftPadding),
            profileSettingsButton.rightAnchor.constraint(equalTo: profileSettingsView1.rightAnchor)
        ])
    }

    func setupThemeSettingsButtonConstraints() {
        NSLayoutConstraint.activate([
            themeSettingsButton.centerYAnchor.constraint(equalTo: profileSettingsView2.centerYAnchor),
            themeSettingsButton.leftAnchor.constraint(equalTo: profileSettingsView2.leftAnchor, constant: Constants.buttonsLeftPadding),
            themeSettingsButton.rightAnchor.constraint(equalTo: profileSettingsView2.rightAnchor)
        ])
    }

    func setupLanguageSettingsButtonConstraints() {
        NSLayoutConstraint.activate([
            languageSettingsButton.centerYAnchor.constraint(equalTo: profileSettingsView3.centerYAnchor),
            languageSettingsButton.leftAnchor.constraint(equalTo: profileSettingsView3.leftAnchor, constant: Constants.buttonsLeftPadding),
            languageSettingsButton.rightAnchor.constraint(equalTo: profileSettingsView3.rightAnchor)
        ])
    }
}

extension GeneralSettingsView {
    private enum Constants {
        static let buttonsLeftPadding: CGFloat = 20
    }
}
