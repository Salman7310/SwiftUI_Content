import UIKit
import Combine
import XCTest

/* Test a publisher is emitting a valid value or not */

class HelloCombineTests: XCTestCase {
    
    func testFirstCase() {
        
        let expectation = XCTestExpectation(description: "Received value")
        
        let publisher = Just("Hello World")
        
        let _ = publisher.sink { value in
            XCTAssertEqual(value, "Hello World")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
}

HelloCombineTests.defaultTestSuite.run()
