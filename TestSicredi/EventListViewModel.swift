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
    struct Input {
        let selectedItem: Observable<Event>
    }
    
    struct Output {
        let networkingStatus: Driver<(NetworkingState<[Event]>, [Event])>
        let selectedItem: Driver<Event>
    }
    
     // MARK: - Life Cycle
    init(eventListUsecaseProtocol: EventListUsecaseProtocol) {
        self.useCase = eventListUsecaseProtocol
    }
    
    // MARK: - Functions
    func transform(inputs: Input) -> EventListViewModel.Output {
        
        let selectedItem = inputs.selectedItem.asDriver(onErrorJustReturn: Event())
        
        let listRequest = useCase.getEvents().asDriver(onErrorJustReturn: ((.fail(NetworkingError.fail),[Event]())))
        
        return Output(networkingStatus: listRequest, selectedItem: selectedItem)
    }
    
}
