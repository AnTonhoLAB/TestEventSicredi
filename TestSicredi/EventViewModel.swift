//
//  EventViewModel.swift
//  TestSicredi
//
//  Created by George Gomes on 17/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class EventViewModel {
    private var eventListUsecaseProtocol: EventListUsecaseProtocol!
    private var event: Event!
    
    struct Output {
        let title: Driver<String?>
    }
    
    init(eventListUsecaseProtocol: EventListUsecaseProtocol, event: Event) {
        self.event = event
        self.eventListUsecaseProtocol = eventListUsecaseProtocol
    }
    
    func transform() -> EventViewModel.Output {
        let title = Observable<String?>.create { (observer) -> Disposable in
            observer.onNext(self.event.title)
             return Disposables.create()
        }.asDriver(onErrorJustReturn: "Nome indisponível")
         
        let output = Output(title: title)
        return output
    }
}


