//
//  CheckInViewController.swift
//  TestSicredi
//
//  Created by George Gomes on 18/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CheckInViewController: UpdatableViewController {
    
    // MARK: - Constants
    private let disposeBag: DisposeBag = DisposeBag()
    
    // MARK: - Variables
    private var viewModel: CheckInViewModel!
    private var eventListView: CheckInViewComponents!
    var openEvent: ((_ event: Event)->())?
    
    // MARK: - Life Cycle
    init(with view: CheckInViewComponents, viewModel: CheckInViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.eventListView = view
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
