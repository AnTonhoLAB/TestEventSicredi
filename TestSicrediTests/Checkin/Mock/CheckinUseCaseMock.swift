//
//  CheckinUseCaseMock.swift
//  TestSicrediTests
//
//  Created by George Gomes on 18/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import Foundation
import RxSwift

@testable import TestSicredi

class CheckinUseCaseMock: CheckinUseCaseProtocol {
    func checkin(id: String, name: String, email: String) -> Observable<NetworkingState<Data>> {
        return Observable<NetworkingState<Data>>.create{ observer in
            observer.onNext(.loading)
            let path = Bundle(for: type(of: self)).url(forResource: "EventListStub", withExtension: "json")!
            let data = try! Data(contentsOf: path)
            
            observer.onNext(.success(Data()))
            observer.onCompleted()
            return Disposables.create()
        }
    }
}
