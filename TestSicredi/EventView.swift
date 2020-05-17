//
//  EventView.swift
//  TestSicredi
//
//  Created by George Gomes on 17/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol EventViewComponents: UIView {
    /// To read UI informations
    var tableViewObservable: Observable<String> { get }
    /// To change UI informations
}

class EventView: UIView {
    
}

extension EventView: CodeView {
    func buildViewHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
    
    func setupAdditionalConfiguration() {
        
    }
    
    
}
