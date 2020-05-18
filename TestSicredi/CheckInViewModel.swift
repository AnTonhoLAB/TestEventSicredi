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
    
     // MARK: - Intputs/Outputs
    struct Input {
    }
    
    struct Output {
    }
    
     // MARK: - Life Cycle
    init(checkInUsecaseProtocol: CheckinUseCaseProtocol) {
        self.useCase = checkInUsecaseProtocol
    }
    
    // MARK: - Functions
    func transform(inputs: Input) -> CheckInViewModel.Output {
        
        
        return Output()
    }
    
}
