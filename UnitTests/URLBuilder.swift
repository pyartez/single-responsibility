//
//  URLBuilder.swift
//  UnitTests
//
//  Created by Phil Yates on 08/04/2021.
//

import Foundation

class NewsURLBuilder {
    private let hostName: String
    
    init(hostName: String) {
        self.hostName = hostName
    }
    
    func getNews() -> URLRequest {
        let url = URL(string: "\(hostName)SomeNews/URL")!
        let request = URLRequest(url: url)

        return request
    }
}
