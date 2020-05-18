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
    
    // MARK: - Variables
    private var useCase: EventListUsecaseProtocol!
    
     // MARK: - Intputs/Outputs
    struct Output {
        let networkingStatus: Driver<(NetworkingState<[Event]>, [Event])>
    }
    
     // MARK: - Life Cycle
    init(eventListUsecaseProtocol: EventListUsecaseProtocol) {
        self.useCase = eventListUsecaseProtocol
    }
    
    // MARK: - Functions
    func transform() -> EventListViewModel.Output {
        let listRequest = useCase.getEvents().asDriver(onErrorJustReturn: ((.fail(NetworkingError.fail),[Event]())))
        return Output(networkingStatus: listRequest)
    }
    
}
