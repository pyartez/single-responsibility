//
//  UnitTestsTests.swift
//  UnitTestsTests
//
//  Created by Phil Yates on 08/04/2021.
//

import XCTest
@testable import UnitTests

class URLBuilderTests: XCTestCase {

    func testURLBuilder() throws {
        let builder = NewsURLBuilder(hostName: "http://mytest.com/")
        let request = builder.getNews()
        
        XCTAssertEqual(request.url?.absoluteString, "http://mytest.com/SomeNews/URL", "Request URL string is incorrect")
    }

}
