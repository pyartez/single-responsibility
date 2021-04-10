//
//  NewsParserTests.swift
//  UnitTestsTests
//
//  Created by Phil Yates on 10/04/2021.
//

import XCTest
@testable import UnitTests

class NewsParserTests: XCTestCase {

    func testCorrectData() throws {
        let correctJSON = """
        [
          {
            "id": 1,
            "title": "Test Article 1"
          },
          {
            "id": 2,
            "title": "Test Article 2"
          }
        ]
        """
        
        let data = correctJSON.data(using: .utf8)!
        
        let parser = NewsParser(decoder: JSONDecoder())
        let news = parser.parse(data: data)
        XCTAssertFalse(news.isEmpty)
        XCTAssertEqual(news[0].id, 1)
        XCTAssertEqual(news[0].title, "Test Article 1")
    }

    
    func testInCorrectData() throws {
        let incorrectJSON = """
        [
          {
            "id": 1,
            "title": "Test Article 1"
          },
          {
            "id": 2,
        ]
        """
        
        let data = incorrectJSON.data(using: .utf8)!
        
        let parser = NewsParser(decoder: JSONDecoder())
        let news = parser.parse(data: data)
        XCTAssertTrue(news.isEmpty)
    }
}
