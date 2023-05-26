//
//  ViewBookModel.swift
//  TestUICodeForOpenLibrary
//
//  Created by Pavel Nesterenko on 21.05.23.
//

import Foundation

struct BookInfoModel: Codable {
    var title: String
    var covers: [Int]
    var description: String?
    
    
    enum CodingKeys: String, CodingKey {
        case title, covers
        case description
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        do {
            if let descriptionContainer = try? container.nestedContainer(keyedBy: DescriptionCodingKeys.self, forKey: .description) {
                description = try descriptionContainer.decode(String.self, forKey: .value)
                title = try container.decode(String.self, forKey: .title)
                covers = try container.decode([Int].self, forKey: .covers)
            } else {
                description = try container.decode(String.self, forKey: .description)
                covers = try container.decode([Int].self, forKey: .covers)
                title = try container.decode(String.self, forKey: .title)
            }
        } catch {
            covers = [0]
            title = ""
            description = nil
        }

        enum DescriptionCodingKeys: String, CodingKey {
            case value
        }
    }
    
}
