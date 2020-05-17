//
//  EventListDiferentValuesTests.swift
//  TestSicrediTests
//
//  Created by George Gomes on 17/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import XCTest
import Mockingjay

@testable import TestSicredi
/*
    This file contains the data as the server but with some items missing to test the code if it works around errors
*/
class EventListDiferentValuesTests: XCTestCase {

   var eventListRequester: EventListRequester!
       
   override func setUp() {
       super.setUp()
       let url = Bundle(for: type(of: self)).url(forResource: "EventListDiferentValues", withExtension: "json")!
       let data = try! Data(contentsOf: url)
       self.eventListRequester = EventListRequester(nil)
       stub(http(.get, uri: "http://5b840ba5db24a100142dcd8c.mockapi.io/api/events"), http(200, headers: ["Content-Type":"application/json"], download: .content(data)))
   }

   override func tearDown() {
       self.eventListRequester = nil
   }

   func testEventListReturnId() {
       let expectation = self.expectation(description: "calls the callback with a resource item")
       
       eventListRequester.getList(){(result) in
           switch result {
           case .success(let res):
               let id = res[0].id
               XCTAssertNotNil(id)
           case .failure(let err):
               XCTFail(err.localizedDescription)
           }
           expectation.fulfill()
       }
       self.waitForExpectations(timeout: 1.0, handler: .none)
       removeAllStubs()
   }
    
    func testEventListReturnNilEventDescription() {
        let expectation = self.expectation(description: "calls the callback with a resource item")
        
        eventListRequester.getList(){(result) in
            switch result {
            case .success(let res):
                let eventDescription = res[0].eventDescription
                XCTAssertNil(eventDescription)
            case .failure(let err):
                XCTFail(err.localizedDescription)
            }
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 1.0, handler: .none)
        removeAllStubs()
    }
     
    


}
