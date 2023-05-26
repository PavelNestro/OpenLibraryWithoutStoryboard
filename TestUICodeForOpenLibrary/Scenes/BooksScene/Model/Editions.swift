//
//  Editions.swift
//  TestUICodeForOpenLibrary
//
//  Created by Pavel Nesterenko on 19.05.23.
//

import Foundation

struct Editions: Codable {
    let covers: [Int]
    let title: String
    let publishDate: String
    let works: [Key]
    let imageLike: Bool?

    
    enum CodingKeys: String, CodingKey {
        case covers, title, works
        case imageLike = "imageLike"
        case publishDate = "publish_date"
    }
}
