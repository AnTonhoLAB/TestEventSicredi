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
    
    // MARK: - Variables
    private var viewModel: EventListViewModel!
    private var eventListView: EventListViewComponents!
    var openEvent: ((_ event: Event)->())?
    
    // MARK: - Life Cycle
    init(with view: EventListViewComponents, viewModel: EventListViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.eventListView = view
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
        let input = EventListViewModel.Input(selectedItem: eventListView.eventListTableView.rx.modelSelected(Event.self).asObservable())
        let outputs = viewModel.transform(inputs: input)
        
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
        
        outputs.selectedItem
            .map { $0 }
            .asObservable()
            .bind { (event) in
                self.openEvent?(event)
        }
        .disposed(by: disposeBag)

    }
    
    // MARK: - Functions
    override func loadView() {
        self.view = eventListView
    }
}
