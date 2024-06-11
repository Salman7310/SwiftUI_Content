//
//  StarbucksRowsDataTests.swift
//  Test_ StarbucksAppTests
//
//  Created by Salman_Macbook on 14/03/24.
//

import XCTest
@testable import Test__StarbucksApp

final class StarbucksRowsDataTests: XCTestCase {

    var starbucksList: [Starbucks]? = nil
    var starbucksRowsData: StarbucksRowsData? = nil

    override func setUp() {
        fetchMock()
    }

    override func tearDown() {
        starbucksRowsData = nil
        starbucksList = nil
    }

    func fetchMock() {
        self.starbucksList = starbucks
        starbucksRowsData = StarbucksRowsData(starbucks: starbucks[0])
    }

    func test_startbucksRowData() {
        // Assert
        XCTAssertNotNil(starbucksList)
        XCTAssertNotNil(starbucksRowsData)
        XCTAssertEqual(starbucksRowsData?.starbucks.name, starbucksList?.first?.name)
        XCTAssertEqual(starbucksRowsData?.starbucks.distance, starbucksList?.first?.distance)
        XCTAssertEqual(starbucksRowsData?.starbucks.id, starbucksList?.first?.id)
    }
}
