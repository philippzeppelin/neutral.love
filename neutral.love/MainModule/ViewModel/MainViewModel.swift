//
//  MainViewModel.swift
//  neutral.love
//
//  Created by Sergei Smirnov on 16.10.2023.
//

import Foundation

protocol MainViewModelProtocol {
    var style: [String] { get }
    var layout: [String] { get }
    var amount: [String] { get }
    var arrayOutput: [Output] { get set }
    var delegate: MainViewModelProtocolDelegate? { get set }
    func fetchData()
    var orderIDString: String? { get set }
}

protocol MainViewModelProtocolDelegate: AnyObject {
    func didLoadData()
}

final class MainViewModel: MainViewModelProtocol {
    
    var style = ["Photo", "Fantasy", "Anime", "Painting", "Sci-Fi", "Cyberpunk", "Pixelart", "Steampunk", "Synthwave"]
    var layout = ["Square", "Vertical", "Horizontal"]
    var amount = ["4", "8", "12"]
    
    var arrayOutput = [Output]()
    weak var delegate: MainViewModelProtocolDelegate?
    var orderIDString: String?
    var orderInfo: OrderInfo?
    let apiManager = APIManager()
    
    func fetchData() {
        
        Task {
            let orderID = try await apiManager.fetchOrderIDString()
            let data = try await apiManager.fetchOrderInfoOutput(orderID: orderID)
            
            arrayOutput = data
            delegate?.didLoadData()
        }
    }
}
