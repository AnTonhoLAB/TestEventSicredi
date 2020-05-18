//
//  EventDetailViewModel.swift
//  TestSicredi
//
//  Created by George Gomes on 17/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class EventDetailViewModel {
    
    // MARK: - Variables
    private var event: Event!
    
     // MARK: - Intputs/Outputs
    struct Input {
        
    }
    
    struct Output {
        let imageLink: Driver<String?>
        let title: Driver<String?>
        let price: Driver<String?>
        let description: Driver<String?>
    }
    
     // MARK: - Life Cycle
    init(event: Event) {
        self.event = event
    }
    
    // MARK: - Functions
    func transform(inputs: Input) -> EventDetailViewModel.Output {
        let imageLink = Observable<String?>.create { (observer) -> Disposable in
            observer.onNext(self.event.image)
            return Disposables.create()
        }
        .asDriver(onErrorJustReturn: "Sem link")
        
        let title = Observable<String?>.create { (observer) -> Disposable in
            observer.onNext(self.event.title)
            return Disposables.create()
        }
        .asDriver(onErrorJustReturn: "Sem titulo")
        
        let price = Observable<String?>.create { (observer) -> Disposable in
            if let price = self.event.price {
                observer.onNext("R$ \(price)")
            } else {
                observer.onNext("Sem preço")
            }
            return Disposables.create()
        }
        .asDriver(onErrorJustReturn: "Sem preço")
        
        let description = Observable<String?>.create { (observer) -> Disposable in
            observer.onNext(self.event.eventDescription)
            return Disposables.create()
        }
        .asDriver(onErrorJustReturn: "")
        
        return Output(imageLink: imageLink, title: title, price: price, description: description)
    }
    
}
