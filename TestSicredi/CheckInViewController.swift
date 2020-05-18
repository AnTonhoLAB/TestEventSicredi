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
    private var checkinView: CheckInViewComponents!
    var finishFlow: (()->())?
    
    // MARK: - Life Cycle
    init(with view: CheckInViewComponents, viewModel: CheckInViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.checkinView = view
        self.viewModel = viewModel
    }
    
    override func willMove(toParent parent: UIViewController?) {
        if parent == nil {
            self.finishFlow?()
        }
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: - Functions
    override func loadView() {
        self.view = checkinView
    }
}
