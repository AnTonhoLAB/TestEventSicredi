//
//  CheckInViewModel.swift
//  TestSicredi
//
//  Created by George Gomes on 18/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class CheckInViewModel {
    
    // MARK: - Variables
    private var useCase: CheckinUseCaseProtocol!
    private var event: Event!
    
    // MARK: - Intputs/Outputs
    struct Input {
        let name: Observable<String>
        let email: Observable<String>
        let didTapCheckin: Observable<Void>
    }
    
    struct Output {
        let networkingStatus: Driver<NetworkingState<Data>>
    }
    
     // MARK: - Life Cycle
    init(checkInUsecaseProtocol: CheckinUseCaseProtocol, event: Event) {
        self.event = event
        self.useCase = checkInUsecaseProtocol
    }
    
    // MARK: - Functions
    func transform(inputs: Input) -> CheckInViewModel.Output {
        let userInputs = Observable.combineLatest( inputs.name, inputs.email) { (name, email) -> (String, String) in
            return ( name, email)
        }
        
        let checkin = inputs.didTapCheckin
            .withLatestFrom(userInputs)
            .flatMap { (name, email) in
                return self.useCase.checkin(id: self.event.id ?? "x", name: name, email: email)
            }
        .asDriver(onErrorJustReturn: .default)
        
        return Output(networkingStatus: checkin)
    }
    
}
