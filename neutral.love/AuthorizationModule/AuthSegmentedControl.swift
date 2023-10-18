//
//  AuthSegmentedControl.swift
//  neutral.love
//
//  Created by Philipp Zeppelin on 18.10.2023.
//

import UIKit

class AuthSegmentedControl: UIView {
    public lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Login",
                                                          "Sign up"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = .systemGreen
        // добавить доп конфигурацию
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()

    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        setupView()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureView() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - Constraints
extension AuthSegmentedControl {
    private func setupView() {
        addSubview(segmentedControl)
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: topAnchor),
            segmentedControl.leftAnchor.constraint(equalTo: leftAnchor),
            segmentedControl.rightAnchor.constraint(equalTo: rightAnchor),
            segmentedControl.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
