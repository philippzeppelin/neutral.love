//
//  AboutUsView.swift
//  neutral.love
//
//  Created by Philipp Zeppelin on 27.11.2023.
//

import UIKit

protocol AboutUsViewDelegate: AnyObject {
    func projectLinkButtonPressed()
    func philippLinkButtonPressed()
    func sergeyLinkButtonPressed()
}

final class AboutUsView: UIView {
    weak var delegate: AboutUsViewDelegate?

    private let firstDividerView = DividerView()
    private let secondDividerView = DividerView()

    private let projectLinkView1 = UIView()
    private let projectLinkView2 = UIView()
    private let projectLinkView3 = UIView()

    private let viewsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 1
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let profileLinkButton = UIButton()
    private let philippLinkButton = UIButton()
    private let sergeyLinkButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAppearence()
        embedView()

        setupViewsStackView()
        setupProjectLinkButton()
        setupPhilippLinkButton()
        setupSergeyLinkButton()

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
            viewsStackView.addArrangedSubview(projectLinkView1)
            viewsStackView.addArrangedSubview(projectLinkView2)
            viewsStackView.addArrangedSubview(projectLinkView3)
        }

    private func setupProjectLinkButton() {
        profileLinkButton.setTitle("Project link", for: .normal)
        profileLinkButton.titleLabel?.font = Resources.Fonts.arial17
        profileLinkButton.setTitleColor(.label, for: .normal)
        profileLinkButton.contentHorizontalAlignment = .left
        profileLinkButton.addTarget(self, action: #selector(projectLinkButtonPressed), for: .touchUpInside)
        profileLinkButton.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupPhilippLinkButton() {
        philippLinkButton.setTitle("Philipp", for: .normal)
        philippLinkButton.titleLabel?.font = Resources.Fonts.arial17
        philippLinkButton.setTitleColor(.label, for: .normal)
        philippLinkButton.contentHorizontalAlignment = .left
        philippLinkButton.addTarget(self, action: #selector(philippLinkButtonPressed), for: .touchUpInside)
        philippLinkButton.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupSergeyLinkButton() {
        sergeyLinkButton.setTitle("Sergey", for: .normal)
        sergeyLinkButton.titleLabel?.font = Resources.Fonts.arial17
        sergeyLinkButton.setTitleColor(.label, for: .normal)
        sergeyLinkButton.contentHorizontalAlignment = .left
        sergeyLinkButton.addTarget(self, action: #selector(sergeyLinkButtonPressed), for: .touchUpInside)
        sergeyLinkButton.translatesAutoresizingMaskIntoConstraints = false
    }

    @objc
    private func projectLinkButtonPressed() {
        delegate?.projectLinkButtonPressed()
    }

    @objc
    private func philippLinkButtonPressed() {
        delegate?.philippLinkButtonPressed()
    }

    @objc
    private func sergeyLinkButtonPressed() {
        delegate?.sergeyLinkButtonPressed()
    }
}

// MARK: - Setup Appearence

extension AboutUsView {
    private func setupAppearence() {
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - Setup Constraints and View

private extension AboutUsView {
    func embedView() {
        [
            viewsStackView,
            firstDividerView,
            secondDividerView
        ].forEach { addSubview($0) }

        projectLinkView1.addSubview(profileLinkButton)
        projectLinkView2.addSubview(philippLinkButton)
        projectLinkView3.addSubview(sergeyLinkButton)
    }

    func setupDividersConstraints() {
        NSLayoutConstraint.activate([
            firstDividerView.topAnchor.constraint(equalTo: projectLinkView1.bottomAnchor),
            firstDividerView.leftAnchor.constraint(equalTo: leftAnchor),
            firstDividerView.rightAnchor.constraint(equalTo: rightAnchor),
            firstDividerView.bottomAnchor.constraint(equalTo: projectLinkView2.topAnchor),

            secondDividerView.topAnchor.constraint(equalTo: projectLinkView2.bottomAnchor),
            secondDividerView.leftAnchor.constraint(equalTo: leftAnchor),
            secondDividerView.rightAnchor.constraint(equalTo: rightAnchor),
            secondDividerView.bottomAnchor.constraint(equalTo: projectLinkView3.topAnchor)
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
            profileLinkButton.centerYAnchor.constraint(equalTo: projectLinkView1.centerYAnchor),
            profileLinkButton.leftAnchor.constraint(equalTo: projectLinkView1.leftAnchor, constant: Constants.buttonsLeftPadding),
            profileLinkButton.rightAnchor.constraint(equalTo: projectLinkView1.rightAnchor)
        ])
    }

    func setupThemeSettingsButtonConstraints() {
        NSLayoutConstraint.activate([
            philippLinkButton.centerYAnchor.constraint(equalTo: projectLinkView2.centerYAnchor),
            philippLinkButton.leftAnchor.constraint(equalTo: projectLinkView2.leftAnchor, constant: Constants.buttonsLeftPadding),
            philippLinkButton.rightAnchor.constraint(equalTo: projectLinkView2.rightAnchor)
        ])
    }

    func setupLanguageSettingsButtonConstraints() {
        NSLayoutConstraint.activate([
            sergeyLinkButton.centerYAnchor.constraint(equalTo: projectLinkView3.centerYAnchor),
            sergeyLinkButton.leftAnchor.constraint(equalTo: projectLinkView3.leftAnchor, constant: Constants.buttonsLeftPadding),
            sergeyLinkButton.rightAnchor.constraint(equalTo: projectLinkView3.rightAnchor)
        ])
    }
}

extension AboutUsView {
    private enum Constants {
        static let buttonsLeftPadding: CGFloat = 20
    }
}
