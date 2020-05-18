//
//  EventListUseCaseMock.swift
//  TestSicrediTests
//
//  Created by George Gomes on 18/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import Foundation
import RxSwift

@testable import TestSicredi

final class EventListUseCaseMock: EventListUsecaseProtocol, BaseUseCase {

    // MARK: - Variables
    private var requester: EventListRequesterProtocol!
    
    // MARK: - Life Cycle
    init(eventListRequester: EventListRequester) {
        self.requester = eventListRequester
    }

    // MARK: - Functions
    func getEvents() -> Observable<(NetworkingState<[AppEvent]>, [AppEvent])> {
        return Observable<(NetworkingState<[AppEvent]>, [AppEvent])>.create{ observer in
            observer.onNext((.loading, [AppEvent]()))
            let path = Bundle(for: type(of: self)).url(forResource: "EventListStub", withExtension: "json")!
            let data = try! Data(contentsOf: path)
            let events: [AppEvent] = try! Decoder.decodeObject(type: [AppEvent].self, from: data)
            observer.onNext((.success(events), events))
            observer.onCompleted()
            return Disposables.create()
        }
    }
}
