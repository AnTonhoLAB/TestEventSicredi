//
//  EventListWrongRequesterTests.swift
//  TestSicrediTests
//
//  Created by George Gomes on 17/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import XCTest
import Mockingjay

@testable import TestSicredi
/*
    This file contains completely wrong data
*/

class EventListWrongRequesterTests: XCTestCase {
    var eventListRequester: EventListRequester!
          
    override func setUp() {
        super.setUp()
        let url = Bundle(for: type(of: self)).url(forResource: "EventListWrongStub", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        self.eventListRequester = EventListRequester(nil)
        stub(http(.get, uri: "http://5b840ba5db24a100142dcd8c.mockapi.io/api/events"), http(200, headers: ["Content-Type":"application/json"], download: .content(data)))
    }

    override func tearDown() {
        self.eventListRequester = nil
    }

    func testEventListWithWrongValues() {
      
        let expectation = self.expectation(description: "calls the callback with a resource object")

        eventListRequester.getList(){(result) in
            switch result {
            case .success(_):
                XCTFail()
            case .failure(let err):
                XCTAssertNotNil(err)
            }
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 1.0, handler: .none)
        removeAllStubs()
    }
}
