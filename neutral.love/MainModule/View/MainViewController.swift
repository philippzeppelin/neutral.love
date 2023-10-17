//
//  MainViewController.swift
//  neutral.love
//
//  Created by Philipp Zeppelin on 05.10.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Init
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private constants
    
    private enum UIConstants {
//        static let mainViewHeight: CGFloat = 531
    }
    
    // MARK: - Properties
    
    let viewModel: MainViewModel
    
    private let mainCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collection.register(MainCollectionViewCell.self,
                            forCellWithReuseIdentifier: MainCollectionViewCell.identifier)
        collection.register(UICollectionViewCell.self,
                                forCellWithReuseIdentifier: "cell")
        collection.backgroundColor = Resources.Colors.MainModule.mainCollectionBackground
        collection.bounces = false
        collection.showsVerticalScrollIndicator = false
        collection.delaysContentTouches = false
        collection.contentInsetAdjustmentBehavior = .never
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    private lazy var pageControl: UIPageControl = {
        let control = UIPageControl()
        control.numberOfPages = 4
        control.addTarget(self,
                          action: #selector(pageControlDidChange(_:)),
                          for: .valueChanged)
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    // MARK: - Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setDelagates()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = Resources.Colors.MainModule.backgroundMainViewController
        view.addSubview(mainCollectionView)
        mainCollectionView.contentSize = CGSize(width: (view.frame.width - 30) * 3 + 20,
                                        height: mainCollectionView.frame.height)
        view.addSubview(pageControl)
    }
    
    @objc private func pageControlDidChange(_ sender: UIPageControl) {
        let currentPage = sender.currentPage
        mainCollectionView.setContentOffset(CGPoint(x: CGFloat(currentPage) * (view.frame.width - 20),
                                                    y: 0),
                                            animated: true)
    }
    
    private func setDelagates() {
        mainCollectionView.dataSource = self
        mainCollectionView.delegate = self
    }
}

// MARK: - Set Constraints

extension MainViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
//            mainCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            mainCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
            mainCollectionView.widthAnchor.constraint(equalToConstant: view.frame.width - 40),
            mainCollectionView.heightAnchor.constraint(equalToConstant: view.frame.width - 40),
            mainCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainCollectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            pageControl.topAnchor.constraint(equalTo: mainCollectionView.bottomAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 40),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

// MARK: - UICollectionViewDelegate

extension MainViewController: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = Int( ( Float(mainCollectionView.contentOffset.x) / Float(view.frame.width - 30) ) )
        pageControl.currentPage = page
    }
}

// MARK: - UICollectionViewDataSource

extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            guard let cell = mainCollectionView.dequeueReusableCell(
                withReuseIdentifier: MainCollectionViewCell.identifier,
                for: indexPath
            ) as? MainCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        
        CGSize(width: (view.frame.width - 30),
                height: mainCollectionView.frame.height)
    }
}
