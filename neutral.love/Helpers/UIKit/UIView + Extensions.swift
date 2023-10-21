//
//  UIView + Extensions.swift
//  neutral.love
//
//  Created by Philipp Zeppelin on 15.10.2023.
//

import UIKit

extension UIView {
    /// Add multiple subviews
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
