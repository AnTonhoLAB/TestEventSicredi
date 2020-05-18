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
    private var useCase: EventListUsecaseProtocol!
    
     // MARK: - Intputs/Outputs
    struct Input {
        
    }
    
    struct Output {
       
    }
    
     // MARK: - Life Cycle
    init() {
        
    }
    
    // MARK: - Functions
    func transform(inputs: Input) -> EventDetailViewModel.Output {
        return Output()
    }
    
}
