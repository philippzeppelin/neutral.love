//
//  APIModels.swift
//  neutral.love
//
//  Created by Sergei Smirnov on 24.10.2023.
//

import Foundation

// MARK: - OrderID
struct OrderID: Codable {
    let orderID: String
    let price: Price

    enum CodingKeys: String, CodingKey {
        case orderID = "orderId"
        case price
    }
}

// MARK: - Price
struct Price: Codable {
    let amount, currency: String
}

// MARK: - OrderInfo
struct OrderInfo: Codable {
    let id, type, name, slug: String
    let dateCreated: Int
    let sortBy: String
    let status: Status
    let input: Input
    let output: [Output]
    let rating: Rating
    let isPack: Bool
    let thumbnails: [Thumbnail]
    let availabilityStatus, availableUntil: Int
    let access: Access
}

// MARK: - Access
struct Access: Codable {
    let canRemove, canFeedback: Bool
}

// MARK: - Input
struct Input: Codable {
    let prompt, style, layout, sampler: String
    let cfgScale: Double
    let modelVersion: String
    let amount: Int
    let isPublic, isPriority, hasImage, isHD: Bool
    let negativePrompt, augmentedPrompt: String
    let steps, seed: Int
    let customModelID, customModelName: String

    enum CodingKeys: String, CodingKey {
        case prompt, style, layout, sampler, cfgScale, modelVersion, amount, isPublic, isPriority, hasImage
        case isHD = "isHd"
        case negativePrompt, augmentedPrompt, steps, seed
        case customModelID = "customModelId"
        case customModelName
    }
}

// MARK: - Output
struct Output: Codable {
    let id: String
    let type: Int
    let isNsfw: Bool
    let caption: String
    let qualityScore: Double
    let full, preview: String
    let style: String
}

// MARK: - Rating
struct Rating: Codable {
    let total: Int
}

// MARK: - Status
struct Status: Codable {
    let code: Int
    let text, level: String
    let isReady: Bool
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let url: String
    let outputItemID: String
    let width, height: Int

    enum CodingKeys: String, CodingKey {
        case url
        case outputItemID = "outputItemId"
        case width, height
    }
}
