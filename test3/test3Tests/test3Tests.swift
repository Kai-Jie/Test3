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
        let service = MockService()
        let viewModel = ViewModel(apiServer: service)
        
        let expectation = expectation(description: "test")
        
        let _ = viewModel.$testModel.sink() {_ in
            
            expectation.fulfill()
        }

        service.completeResponse()

        wait(for: [expectation], timeout: 5)
        print(viewModel.testModel.count)
        XCTAssertEqual(viewModel.testModel.count, 1)
    }

    private class MockService: APIServiceType {
        var response: (()->())?

        func webAPI() {
            response = {
                NotificationCenter.default.post(name:Notification.Name(rawValue:"TestNotificationName"), object: self)
            }
        }

        func completeResponse() {
            response?()
        }
    }
}
