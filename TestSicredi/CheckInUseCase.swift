//
//  CheckInUseCase.swift
//  TestSicredi
//
//  Created by George Gomes on 18/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import Foundation
import RxSwift

protocol CheckinUseCaseProtocol: BaseUseCase {
    func checkin(id: String, name: String, email: String) -> Observable<NetworkingState<Data>>
}

class CheckinUseCase: BaseUseCase, CheckinUseCaseProtocol {
    // MARK: - Variables
    private var requester: EventCheckinRequesterProtocol!
    
    // MARK: - Life Cycle
    init(checkinRequester: EventCheckinRequesterProtocol) {
        self.requester = checkinRequester
    }
    
    // MARK: - Functions
    func checkin(id: String, name: String, email: String) -> Observable<NetworkingState<Data>>{
        return Observable<NetworkingState<Data>>.create { observer in
            observer.onNext(.loading)
            
            if self.hasNetworking {
                self.requester.checkin(id: id, name: name, email: email) { (result) in
                    switch result {
                    case .success(let events):
                        observer.onNext(.success(events))
                    case .failure(let error):
                        observer.onNext(.fail(error))
                    }
                }
            } else {
                observer.onNext(.fail(NetworkingError.noConnection))
            }
                return Disposables.create()
        }
    }
}
