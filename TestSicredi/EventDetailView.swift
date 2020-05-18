//
//  EventDetailView.swift
//  TestSicredi
//
//  Created by George Gomes on 17/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import UIKit
import SnapKit

protocol EventDetailViewComponents: UIView {
    
}

class EventDetailView: UIView, EventDetailViewComponents {
    // MARK: - Public Variables
   

    //MARK: - Initializers
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EventDetailView: CodeView  {

    // MARK: - Constraints Configuration
    func buildViewHierarchy() {
        
    }
    
    // MARK: - Constraints Configuration
    func setupConstraints() {
       
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .red
    }
}



