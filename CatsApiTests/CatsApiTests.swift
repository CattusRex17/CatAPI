//
//  CatsApiTests.swift
//  CatsApiTests
//
//  Created by Mauricio Rodriguez on 6/2/2025.
//

import XCTest
@testable import CatsApi

final class CatsApiTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchCats() {
        let viewModel = CatViewModel()
        let expectation = XCTestExpectation(description: "Fetch cats from API")
        
        viewModel.fetchCats()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            XCTAssertFalse(viewModel.cats.isEmpty)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5.0)
    }
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
