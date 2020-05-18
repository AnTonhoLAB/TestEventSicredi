//
//  EventListRequesterTests.swift
//  TestSicrediTests
//
//  Created by George Gomes on 17/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import XCTest
import Mockingjay

@testable import TestSicredi

/*
    This file contains the data as it should be for the server
*/
class EventListRequesterTests: XCTestCase {

    var eventListRequester: EventListRequester!
        
    override func setUp() {
        super.setUp()
        let url = Bundle(for: type(of: self)).url(forResource: "EventListStub", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        self.eventListRequester = EventListRequester(nil)
        stub(http(.get, uri: "http://5b840ba5db24a100142dcd8c.mockapi.io/api/events"), http(200, headers: ["Content-Type":"application/json"], download: .content(data)))
    }

    override func tearDown() {
        self.eventListRequester = nil
    }
    
    func testInitWithWrongUrl() {
        let wrongCredentials = WrongCredentials()
        let eventListRequester = EventListRequester(wrongCredentials)
        
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

    func testEventListReturn() {
        let expectation = self.expectation(description: "calls the callback with a resource object")

        eventListRequester.getList(){(result) in
            switch result {
            case .success(let res):
                XCTAssertNotNil(res)
            case .failure(let err):
                XCTFail(err.localizedDescription)
            }
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 1.0, handler: .none)
        removeAllStubs()
    }
    
    func testCorrectIten() {
        let expectation = self.expectation(description: "calls the callback with a resource item")
        
        eventListRequester.getList(){(result) in
            switch result {
            case .success(let res):
                let id = res[0].id
                XCTAssertEqual(id, "1")
            case .failure(let err):
                XCTFail(err.localizedDescription)
            }
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 1.0, handler: .none)
        removeAllStubs()
    }

}

struct WrongCredentials: Credentiable {
    var checkin = "/checkinsa"
    var url = "///0ba5db24a100142dcd"
    var basePath = "//api"
    var events = "Ç/events"
    var id = "/%@"
}
