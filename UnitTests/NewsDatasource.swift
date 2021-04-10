//
//  NewsDatasource.swift
//  UnitTests
//
//  Created by Phil Yates on 10/04/2021.
//

import Foundation

class NewsDatasource {
    private let requestBuilder: NewsURLBuilder
    private let parser: NewsParser
    
    init(requestBuilder: NewsURLBuilder, parser: NewsParser) {
        self.requestBuilder = requestBuilder
        self.parser = parser
    }
    
    func getNews(completion: @escaping ([SomeNews]) -> Void) {
        // 1. Create request
        let request = requestBuilder.getNews()
        
        // 2. Fetching data
        let dataTask = URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
            
            // 3. Parsing data
            guard let self = self,
                let data = data else {
                completion([])
                return
            }
            
            completion(self.parser.parse(data: data))
        }
        
        dataTask.resume()
    }
}
