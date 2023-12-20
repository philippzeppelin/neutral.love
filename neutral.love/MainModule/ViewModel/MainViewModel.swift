//
//  MainViewModel.swift
//  neutral.love
//
//  Created by Sergei Smirnov on 16.10.2023.
//

import Foundation

protocol MainViewModelProtocol {
    var delegate: MainViewModelProtocolDelegate? { get set }
    
    var styleData: [String] { get }
    var layoutData: [String] { get }
    var amountData: [String] { get }
    
    var outputs: [Output] { get set }
    
    var textPercentages: Box<String> { get }
    var progresPercentages: Box<Float> { get }
    var generateButtonIsEnabled: Box<Bool> { get }
    var progressUIIsHidden: Box<Bool> { get }
    
    var prompt: String { get set }
    var style: String { get set }
    var layout: String { get set }
    var amount: String { get set }
    
    var imageProvider: ImageProvider { get set }
    
    func fetchData()
    func countdownForGeneratingImages()
}

protocol MainViewModelProtocolDelegate: AnyObject {
    func didLoadData()
}

final class MainViewModel: MainViewModelProtocol {
    
    weak var delegate: MainViewModelProtocolDelegate?
    
    var styleData = [
        "Photo",
        "Fantasy",
        "Anime",
        "Painting",
        "Sci-Fi",
        "Cyberpunk",
        "Pixelart",
        "Steampunk",
        "Synthwave"
    ]
    var layoutData = [
        "Square",
        "Vertical",
        "Horizontal"
    ]
    var amountData = ["4", "8", "12"]
    
    var prompt: String = "a cat"
    var style: String = "Painting"
    var layout: String = "Square"
    var amount: String = "4"
    
    var textPercentages: Box<String> = Box("0 %")
    var progresPercentages: Box<Float> = Box(0.0)
    var generateButtonIsEnabled: Box<Bool> = Box(true)
    var progressUIIsHidden: Box<Bool> = Box(true)
    
    var outputs: [Output] = []
    
    let apiManager = APIManager()
    var imageProvider = ImageProvider()
    
    func fetchData() {
        Task {
            let orderID = try await apiManager.fetchOrderID(prompt: prompt,
                                                            style: style,
                                                            layout: layout,
                                                            amount: amount)
            outputs = try await apiManager.fetchOrderInfoOutput(orderID: orderID)
            
            delegate?.didLoadData()
        }
    }
    
    func countdownForGeneratingImages() {
        progressUIIsHidden.value = false
        generateButtonIsEnabled.value = false
        
        var timeLeft: Float = 0.1
        var progress: Float = 0.0
        var progressPercentages = 0
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] timer in
            timeLeft += 0.1
            progress = timeLeft / Float(30) // 30 сек. задержка в АПИ
            progressPercentages = Int((timeLeft / Float(30)) * 100)
            
            self?.textPercentages.value = "\(progressPercentages) %"
            self?.progresPercentages.value = progress
            
            if timeLeft >= 30 {
                timer.invalidate()
                self?.generateButtonIsEnabled.value = true
                self?.progressUIIsHidden.value = true
            }
        }
    }
}
