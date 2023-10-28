//
//  MainViewController.swift
//  neutral.love
//
//  Created by Philipp Zeppelin on 05.10.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: - Properties
    
    private let viewModel: MainViewModelProtocol
    
    private let mainCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collection.register(MainCollectionViewCell.self,
                            forCellWithReuseIdentifier: .mainCollectionViewCellIdentifier)
        collection.register(UICollectionViewCell.self,
                            forCellWithReuseIdentifier: "cell")
        collection.backgroundColor = Resources.Colors.backgroundGray
        collection.bounces = false
        collection.showsHorizontalScrollIndicator = false
        collection.delaysContentTouches = false
        collection.contentInsetAdjustmentBehavior = .never
        collection.isPagingEnabled = true
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    private lazy var pageControl: UIPageControl = {
        let control = UIPageControl()
        control.numberOfPages = 4 // from view model
        control.addTarget(self,
                          action: #selector(pageControlDidChange(_:)),
                          for: .valueChanged)
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    private lazy var generateButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = Resources.Colors.MainModule.generateButtonBackground
        button.layer.cornerRadius = Constants.generateButtonCornerRadius
        button.setTitle(Resources.Strings.MainModule.generateButton, for: .normal)
        button.titleLabel?.font = Resources.Fonts.SFProTextSemibold17
        button.tintColor = Resources.Colors.white
        button.addTarget(self, action: #selector(presentGenerateViewController), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Init
    
    init(viewModel: MainViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setDelagates()
        setupConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = Resources.Colors.backgroundGray
        view.addSubview(mainCollectionView)
        view.addSubview(pageControl)
        view.addSubview(generateButton)
    }
    
    @objc private func pageControlDidChange(_ sender: UIPageControl) {
        let currentPage = sender.currentPage
        mainCollectionView.setContentOffset(
            CGPoint(
                x: CGFloat(currentPage) * (mainCollectionView.frame.width),
                y: 0
            ),
            animated: true
        )
    }
    
    @objc private func presentGenerateViewController() {
        let viewController = GenerateAssembly.configure()
        present(viewController, animated: true)
    }
    
    private func setDelagates() {
        mainCollectionView.dataSource = self
        mainCollectionView.delegate = self
    }
}

// MARK: - Setup Constraints

private extension MainViewController {
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            mainCollectionView.widthAnchor.constraint(
                equalToConstant: view.frame.width - Constants.mainCollectionViewSpacing * 2
            ),
            mainCollectionView.heightAnchor.constraint(
                equalToConstant: view.frame.width - Constants.mainCollectionViewSpacing * 2
            ),
            mainCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainCollectionView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: view.frame.height / 7
            ),
            
            pageControl.topAnchor.constraint(equalTo: mainCollectionView.bottomAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: Constants.pageControlHeigth),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            generateButton.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: Constants.generateButtonTop),
            generateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            generateButton.heightAnchor.constraint(equalToConstant: Constants.generateButtonHeight),
            generateButton.widthAnchor.constraint(equalToConstant: Constants.generateButtonWidth)
        ])
    }
}

// MARK: - UICollectionViewDelegate

extension MainViewController: UICollectionViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = Int( ( Float(mainCollectionView.contentOffset.x) / Float(mainCollectionView.frame.width) ) )
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
            withReuseIdentifier: .mainCollectionViewCellIdentifier,
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
        CGSize(width: mainCollectionView.frame.width,
               height: mainCollectionView.frame.height)
    }
}

// MARK: - Constants

extension MainViewController {
    
    private enum Constants {
        static let generateButtonCornerRadius: CGFloat = 15
        static let generateButtonTop: CGFloat = 40
        static let generateButtonHeight: CGFloat = 50
        static let generateButtonWidth: CGFloat = 200
        static let mainCollectionViewSpacing: CGFloat = 20
        static let pageControlHeigth: CGFloat = 40
    }
}
