//
//  NewsParser.swift
//  UnitTests
//
//  Created by Phil Yates on 10/04/2021.
//

import Foundation

struct SomeNews: Codable {
    let id: Int
    let title: String
}

class NewsParser {
    private let decoder: JSONDecoder
    
    init(decoder: JSONDecoder) {
        self.decoder = decoder
    }
    
    func parse(data: Data) -> [SomeNews] {
        return (try? decoder.decode([SomeNews].self, from: data)) ?? []
    }
}
