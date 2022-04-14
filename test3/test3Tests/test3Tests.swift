//
//  test3Tests.swift
//  test3Tests
//
//  Created by Neo Hsu on 2022/4/14.
//

@testable import test3
import XCTest

class test3Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

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
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
