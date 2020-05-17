//
//  EventListViewModel.swift
//  TestSicredi
//
//  Created by George Gomes on 16/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class EventListViewModel {
    
    private var useCase: EventListUsecaseProtocol!
    
    struct Input {
//        let didReloadList: Observable<Void>
    }
    
    struct Output {
        let networkingStatus: Driver<NetworkingState<[Event]>>
//        let EventList: Driver<[Event]>
    }
    
    init(eventListUsecaseProtocol: EventListUsecaseProtocol) {
        self.useCase = eventListUsecaseProtocol
    }
    
    func transform(input: EventListViewModel.Input) -> EventListViewModel.Output {
        let listRequest = useCase.getEvents().asDriver(onErrorJustReturn: (.fail(NetworkingError.fail)))
        
        return Output(networkingStatus: listRequest)
    }
    
}
