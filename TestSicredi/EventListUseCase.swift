//
//  EventListUseCase.swift
//  TestSicredi
//
//  Created by George Gomes on 17/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import Foundation
import RxSwift

protocol EventListUsecaseProtocol: BaseUseCase {
    func getEvents() -> Observable<NetworkingState<[Event]>>
}

final class EventListUsecase: EventListUsecaseProtocol {

    private var requester: EventListRequesterProtocol!
    
    init(eventListRequester: EventListRequester) {
        self.requester = eventListRequester
    }

    func getEvents() -> Observable<NetworkingState<[Event]>> {
        return Observable<NetworkingState>.create{ observer in
            observer.onNext(.loading)
            self.requester.getList { (result) in
                switch result {
                case .success(let events):
                    observer.onNext(.success(events))
                case .failure(let error):
                    observer.onNext(.fail(error))
                }
            }
            return Disposables.create()
        }
    }
}

protocol BaseUseCase {

}

extension BaseUseCase {
    var hasNetworking: Bool {
        return NetworkingManager.isConnected
    }
}
