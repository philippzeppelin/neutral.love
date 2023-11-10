//
//  MainViewModel.swift
//  neutral.love
//
//  Created by Sergei Smirnov on 16.10.2023.
//

import Foundation

protocol MainViewModelProtocol {
    var delegate: MainViewModelProtocolDelegate? { get set }
    
    var style: [String] { get }
    var layout: [String] { get }
    var amount: [String] { get }
    
    var outputs: [Output] { get set }
    func fetchData()
}

protocol MainViewModelProtocolDelegate: AnyObject {
    func didLoadData()
}

final class MainViewModel: MainViewModelProtocol {
    
    weak var delegate: MainViewModelProtocolDelegate?
    
    var style = ["Photo", "Fantasy", "Anime", "Painting", "Sci-Fi", "Cyberpunk", "Pixelart", "Steampunk", "Synthwave"]
    var layout = ["Square", "Vertical", "Horizontal"]
    var amount = ["4", "8", "12"]
    
    var outputs = [Output]()
    let apiManager = APIManager()
    
    func fetchData() {
        Task {
            let orderID = try await apiManager.fetchOrderID()
            outputs = try await apiManager.fetchOrderInfoOutput(orderID: orderID)
            
            delegate?.didLoadData()
        }
    }
}
