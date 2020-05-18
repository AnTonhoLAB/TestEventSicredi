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

class EventViewModel {
    
    // MARK: - Variables
    private var event: Event!
    
     // MARK: - Intputs/Outputs
    struct Input {
        let didTapShare: Observable<Void>?
        let didTapCheckin: Observable<Void>?
    }
    
    struct Output {
        let imageLink: Driver<String?>
        let title: Driver<String?>
        let date: Driver<String?>
        let price: Driver<String?>
        let description: Driver<String?>
        let location: Driver<(Double, Double)>
        let openShareOptions: Driver<Event>?
        let openCheckinOptions: Driver<Event>?
    }
    
     // MARK: - Life Cycle
    init(event: Event) {
        self.event = event
    }
    
    // MARK: - Functions
    func transform(input: Input = Input(didTapShare: nil, didTapCheckin: nil)) -> EventViewModel.Output {
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
        
        let date = Observable<String?>.create { (observer) -> Disposable in
            observer.onNext(self.event.date?.toFormatedString())
            return Disposables.create()
        }
        .asDriver(onErrorJustReturn: "Sem data marcada")
        
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
        
        let location = Observable<(Double, Double)>.create { (observer) -> Disposable in
            observer.onNext((self.event.latitude ?? 0.0, self.event.longitude ?? 0.0))
            return Disposables.create()
        }
        .asDriver(onErrorJustReturn: (0.0,0.0))
        
        let eventObservable = Observable<Event>.create {(observer) -> Disposable in
            observer.onNext(self.event)
            return Disposables.create()
        }

        let openCheckin = input.didTapCheckin?
            .withLatestFrom(eventObservable)
            .asDriver(onErrorJustReturn: Event())
        
        let openShare = input.didTapShare?
            .withLatestFrom(eventObservable)
            .asDriver(onErrorJustReturn: Event())
        
        return Output(imageLink: imageLink, title: title, date: date, price: price, description: description, location: location, openShareOptions: openShare, openCheckinOptions: openCheckin)
    }
    
}
