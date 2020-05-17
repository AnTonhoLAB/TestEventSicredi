//
//  ListViewController.swift
//  TestSicredi
//
//  Created by George Gomes on 16/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import UIKit
import RxSwift

class EventListViewController: UpdatableViewController {
    
    private let disposeBag: DisposeBag = DisposeBag()
    private var eventListView: EventListViewComponents!
    private var viewModel: EventListViewModel!
    
    init(with view: EventListViewComponents, viewModel: EventListViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.eventListView = view
        self.viewModel = viewModel
    }
    
    override func loadView() {
        self.view = eventListView
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //        let inputs = EventListViewModel.Input(didReloadList: eventListView.t)
        let outputs = viewModel.transform(input: EventListViewModel.Input())
        
        outputs.networkingStatus
            .map({ (state) -> NetworkingState<Any> in
            state.toAny()
            })
            .drive(rx.loadingState)
            .disposed(by: disposeBag)
    }
}
