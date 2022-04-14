//
//  test3Tests.swift
//  test3Tests
//
//  Created by Neo Hsu on 2022/4/14.
//

@testable import test3
import XCTest

class test3Tests: XCTestCase {

    func testXXX() throws {
        let viewModel = ViewModel()
        
        let expectation = expectation(description: "test")
        
        let _ = viewModel.$testModel.sink() {_ in
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
        print(viewModel.testModel.count)
        XCTAssert(viewModel.testModel.count == 1)
    }

}
