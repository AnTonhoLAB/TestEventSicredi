//
//  EventViewModelTests].swift
//  TestSicrediTests
//
//  Created by George Gomes on 18/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import Foundation
import XCTest
import Mockingjay
import RxBlocking
import RxTest
import RxSwift

@testable import TestSicredi

class EventListTests: XCTestCase {
    
    var viewModel: EventListViewModel!
    var disposeBag: DisposeBag!
    var scheduler: TestScheduler!
    var events: [AppEvent]!
    var outputs: EventListViewModel.Output!
    
    override func setUp() {
        super.setUp()
       
        self.scheduler = TestScheduler(initialClock: 0)
        self.disposeBag = DisposeBag()
        
        let eventListRequester = EventListRequester(nil)
        let eventListUseCase = EventListUseCaseMock(eventListRequester: eventListRequester)
        self.viewModel = EventListViewModel(eventListUsecaseProtocol: eventListUseCase)
        
        let path = Bundle(for: type(of: self)).url(forResource: "EventListStub", withExtension: "json")!
        let data = try! Data(contentsOf: path)
        self.events = try! Decoder.decodeObject(type: [AppEvent].self, from: data)
        
        let event = scheduler.createColdObservable([.next(0,self.events[0])])
        let input = EventListViewModel.Input(selectedItem: event.asObservable())
        self.outputs = viewModel.transform(inputs: input)
    }

    func testsNetworkingStatus() {

        let observer: TestableObserver<(NetworkingState<[AppEvent]>)> = scheduler.createObserver(NetworkingState<[AppEvent]>.self)
 
        let correctResult: [Recorded<RxSwift.Event<NetworkingState<[AppEvent]>>>] = [
            Recorded.next(0, .loading),
            Recorded.next(0, .success(events)),
            Recorded.completed(0)
        ]
        
        outputs.networkingStatus
            .asObservable()
            .map { $0.0 }
            .bind(to: observer)
            .disposed(by: disposeBag)
        
        
        scheduler.start()
        XCTAssertEqual(correctResult, observer.events)
    }
        
    func testListFirstItem() {
        let observer: TestableObserver<[AppEvent]> = scheduler.createObserver([AppEvent].self)
        
        let correctResult: [Recorded<RxSwift.Event<[AppEvent]>>] = [
            Recorded.next(0, [AppEvent]()),
            Recorded.next(0, self.events),
            Recorded.completed(0)
        ]
               
        outputs.networkingStatus
            .asObservable()
            .map { $0.1 }
            .bind(to: observer)
            .disposed(by: disposeBag)
               
               
        scheduler.start()
        XCTAssertEqual(correctResult, observer.events)
    }
}
