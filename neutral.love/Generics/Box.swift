//
//  Box.swift
//  MVVM-SwiftBook
//
//  Created by Sergei Smirnov on 12.11.2023.
//

import Foundation

final class Box<T> {
    typealias Listener = (T) -> Void
    
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(listener: @escaping Listener) {
        self.listener = listener
        listener(value)
    }
}
