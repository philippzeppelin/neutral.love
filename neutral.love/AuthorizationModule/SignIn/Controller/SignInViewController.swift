//
//  SignInViewController.swift
//  neutral.love
//
//  Created by Philipp Zeppelin on 15.10.2023.
//

import UIKit

final class SignInViewController: UIViewController {
    private let signInCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(EmailCollectionViewCell.self, forCellWithReuseIdentifier: EmailCollectionViewCell.cellIdentifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        setupView()
        addConstraints()
        setupDelegates()
    }

    private func setupDelegates() {
        signInCollectionView.dataSource = self
        signInCollectionView.delegate = self
    }
}

// MARK: - Constraints
private extension SignInViewController {
    func setupView() {
        view.addSubview(signInCollectionView)
    }

    func addConstraints() {
        NSLayoutConstraint.activate([
            signInCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            signInCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            signInCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            signInCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension SignInViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SignInCollectionViewCell.cellIdentifier, for: indexPath)
        cell.backgroundColor = .systemGreen
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension SignInViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, 
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 300)
    }
}
