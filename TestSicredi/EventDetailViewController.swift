//
//  EventDetailViewController.swift
//  TestSicredi
//
//  Created by George Gomes on 17/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class EventDetailViewController: UpdatableViewController {
    
    // MARK: - Constants
    private let disposeBag: DisposeBag = DisposeBag()
    
    // MARK: - Variables
    private var viewModel: EventDetailViewModel!
    private var detailView: EventDetailViewComponents!
    var openEvent: ((_ event: Event)->())?
    
    // MARK: - Life Cycle
    init(with view: EventDetailViewComponents, viewModel: EventDetailViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.detailView = view
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
//        let input = EventListViewModel.Input(selectedItem: eventListView.eventListTableView.rx.modelSelected(Event.self).asObservable())
        let outputs = viewModel.transform(inputs: EventDetailViewModel.Input())
        
        outputs.imageLink
            .asObservable()
            .bind(to: detailView.eventImage)
            .disposed(by: disposeBag)
        
        outputs.title
            .asObservable()
            .bind(to: detailView.eventTitle)
            .disposed(by: disposeBag)
        
        outputs.price
            .asObservable()
            .bind(to: detailView.price)
            .disposed(by: disposeBag)
        
        outputs.description
            .asObservable()
            .bind(to: detailView.eventDescription)
            .disposed(by: disposeBag)
    

    }
    
    // MARK: - Functions
    override func loadView() {
        self.view = detailView
    }
}
