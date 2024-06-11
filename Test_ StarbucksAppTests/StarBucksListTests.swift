//
//  StarBucksListTests.swift
//  Test_ StarbucksAppTests
//
//  Created by Salman_Macbook on 14/03/24.
//

import XCTest
@testable import Test__StarbucksApp

final class StarBucksListTests: XCTestCase {
    
    var starbucksList: StarBucksList? = nil

    override func setUp() {
        fetchMock()
    }

    override func tearDown() {
        starbucksList = nil
    }
    
    func fetchMock() {
        starbucksList = StarBucksList()
    }
    
    func test_startbucksList() {
        // Assert
        XCTAssertNotNil(starbucksList?.body)
        XCTAssertNotNil(starbucks)
    }
}
