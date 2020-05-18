//
//  CheckinViewModelTests.swift
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

class CheckinViewModelTests: XCTestCase {
    
    var viewModel: CheckInViewModel!
    var disposeBag: DisposeBag!
    var scheduler: TestScheduler!
    var outputs: CheckInViewModel.Output!
    
    override func setUp() {
        super.setUp()
    
        self.scheduler = TestScheduler(initialClock: 0)
        self.disposeBag = DisposeBag()
        
        
        let path = Bundle(for: type(of: self)).url(forResource: "EventListStub", withExtension: "json")!
        let data = try! Data(contentsOf: path)
        let events = try! Decoder.decodeObject(type: [AppEvent].self, from: data)
           
        let checkinUseCaseMock = CheckinUseCaseMock()
        self.viewModel = CheckInViewModel(checkInUsecaseProtocol: checkinUseCaseMock, event: events[0])
    

        let coldObservable = scheduler.createColdObservable([.next(0, "G"), .next(10, "E")])
        let didTapObservable = scheduler.createColdObservable([.next(20, ())])

        let inputs = CheckInViewModel.Input(name: coldObservable.asObservable(), email: coldObservable.asObservable(), didTapCheckin: didTapObservable.asObservable())
        self.outputs = viewModel.transform(inputs: inputs)
    }
    
    func testsFields() {

        let correctResult: [Recorded<RxSwift.Event<NetworkingState<Data>>>] = [
            Recorded.next(20, .loading),
            Recorded.next(20, .success(Data()))
        ]
        
        let observer: TestableObserver<(NetworkingState<Data>)> = scheduler.createObserver(NetworkingState<Data>.self)
        
        outputs.networkingStatus
            .asObservable()
            .bind(to: observer)
            .disposed(by: disposeBag)
            scheduler.start()

            XCTAssertEqual(correctResult, observer.events)
       }
}
