//
//  SignInViewController.swift
//  neutral.love
//
//  Created by Philipp Zeppelin on 15.10.2023.
//

import UIKit
// TODO: Сделать классы для текстфилдов и кнопок?
// TODO: Сделать ячейки
// TODO: Сделать кнопки Sign In & Sign Up
// TODO: Добавить лейблы Email и Password выше текстфилдов
// TODO: Добавить текстфилды
// TODO: Добавить скроллвью для авторизации (когда нажимаешь на текстфилд,окно уходит наверх)

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
        return 4 // TODO: Вывести в глобальные константы цифру 4
    }
    
    // Information about cell. For Email: email cell with textfield
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EmailCollectionViewCell.cellIdentifier, for: indexPath)
        cell.backgroundColor = .systemGreen
        return cell
    } // TODO: Добавить возможность выводить нужные ячейки по цифрам
}

// MARK: - UICollectionViewDelegateFlowLayout
extension SignInViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, 
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 300)
    }
}
