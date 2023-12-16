//
//  FavoritesViewModel.swift
//  neutral.love
//
//  Created by Philipp Zeppelin on 13.11.2023.
//

import Foundation

protocol FavoritesViewModelDelegate: AnyObject {
    func didLoadImages()
}

protocol FavoritesViewModelProtocol {
    var coreDataManager: CoreDataManager { get set }
    var imagesFromDatabase: [GenerateImage] { get set }
    var delegate: FavoritesViewModelDelegate? { get set }
    
    func reloadDatabase()
}

final class FavoritesViewModel: FavoritesViewModelProtocol {
    var imagesFromDatabase: [GenerateImage] = []
    var coreDataManager = CoreDataManager.shared
    weak var delegate: FavoritesViewModelDelegate?
    
    func reloadDatabase() {
        imagesFromDatabase = coreDataManager.obtainSavedImages()
        delegate?.didLoadImages()
    }
}
