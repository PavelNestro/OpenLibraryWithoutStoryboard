//
//  Average.swift
//  TestUICodeForOpenLibrary
//
//  Created by Pavel Nesterenko on 21.05.23.
//

import Foundation

struct Average: Codable {
    let average: Float?
   // let totalStars: Int
    
    enum CodingKeys: String, CodingKey {
       // case totalStars = "totalStars"
        case average = "average"
    }
}
