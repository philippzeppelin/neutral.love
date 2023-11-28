//
//  AboutUsView.swift
//  neutral.love
//
//  Created by Philipp Zeppelin on 27.11.2023.
//

import UIKit

final class AboutUsView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GeneralSettingsView {
    private func setupAppearence() {
        backgroundColor = .green
        translatesAutoresizingMaskIntoConstraints = false
    }
}
