//
//  ListViewController.swift
//  TestSicredi
//
//  Created by George Gomes on 16/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class EventListViewController: UpdatableViewController {
    
    // MARK: - Constants
    private let disposeBag: DisposeBag = DisposeBag()
    private var eventListView: EventListViewComponents!
    
    // MARK: - Variables
    private var viewModel: EventListViewModel!
    
    // MARK: - Life Cycle
    init(with view: EventListViewComponents, viewModel: EventListViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.eventListView = view
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let outputs = viewModel.transform()
        
        outputs.networkingStatus
            .map({ (state) -> NetworkingState<Any> in
                state.0.toAny()
            })
            .drive(rx.loadingState)
            .disposed(by: disposeBag)
        
        outputs.networkingStatus
            .map ({ (tuple) -> [Event] in
                return tuple.1
            })
            .asObservable()
            .bind(to: eventListView.eventListTableView.rx.items(cellIdentifier: "EventTableViewCell", cellType: EventTableViewCell.self)) { row, event, cell in
                let factory = ViewControllerFactory()
                cell.setup(viewModel: factory.instantiateViewModel(event: event))
            }.disposed(by: disposeBag)
    }
    
    // MARK: - Functions
    override func loadView() {
        self.view = eventListView
    }
}
