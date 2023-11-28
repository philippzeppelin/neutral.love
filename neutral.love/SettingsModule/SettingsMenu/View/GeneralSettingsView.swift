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

    private let view1 = UIView()
    private let view2 = UIView()
    private let view3 = UIView()

    private let viewsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 2
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
            viewsStackView.addArrangedSubview(view1)
            viewsStackView.addArrangedSubview(view2)
            viewsStackView.addArrangedSubview(view3)
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

        view1.addSubview(profileSettingsButton)
        view2.addSubview(themeSettingsButton)
        view3.addSubview(languageSettingsButton)
    }

    func setupDividersConstraints() {
        NSLayoutConstraint.activate([
            firstDividerView.topAnchor.constraint(equalTo: view1.bottomAnchor),
            firstDividerView.leftAnchor.constraint(equalTo: leftAnchor),
            firstDividerView.rightAnchor.constraint(equalTo: rightAnchor),
            firstDividerView.bottomAnchor.constraint(equalTo: view2.topAnchor),

            secondDividerView.topAnchor.constraint(equalTo: view2.bottomAnchor),
            secondDividerView.leftAnchor.constraint(equalTo: leftAnchor),
            secondDividerView.rightAnchor.constraint(equalTo: rightAnchor),
            secondDividerView.bottomAnchor.constraint(equalTo: view3.topAnchor)
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
            profileSettingsButton.centerYAnchor.constraint(equalTo: view1.centerYAnchor),
            profileSettingsButton.leftAnchor.constraint(equalTo: view1.leftAnchor, constant: 20),
            profileSettingsButton.rightAnchor.constraint(equalTo: view1.rightAnchor)
        ])
    }

    func setupThemeSettingsButtonConstraints() {
        NSLayoutConstraint.activate([
            themeSettingsButton.centerYAnchor.constraint(equalTo: view2.centerYAnchor),
            themeSettingsButton.leftAnchor.constraint(equalTo: view2.leftAnchor, constant: 20),
            themeSettingsButton.rightAnchor.constraint(equalTo: view2.rightAnchor)
        ])
    }

    func setupLanguageSettingsButtonConstraints() {
        NSLayoutConstraint.activate([
            languageSettingsButton.centerYAnchor.constraint(equalTo: view3.centerYAnchor),
            languageSettingsButton.leftAnchor.constraint(equalTo: view3.leftAnchor, constant: 20),
            languageSettingsButton.rightAnchor.constraint(equalTo: view3.rightAnchor)
        ])
    }
}
