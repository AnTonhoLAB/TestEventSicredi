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
    private var viewModel: EventViewModel!
    private var detailView: EventDetailViewComponents!
    var checkinEvent: ((_ event: Event)->())?
    
    // MARK: - Life Cycle
    init(with view: EventDetailViewComponents, viewModel: EventViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.detailView = view
        self.viewModel = viewModel
        
        let inputs = EventViewModel.Input(didTapShare: detailView.didTapShare, didTapCheckin: detailView.didTapCheckin)
        let outputs = viewModel.transform(input: inputs)
        
        outputs.imageLink
            .asObservable()
            .bind(to: detailView.eventImage)
            .disposed(by: disposeBag)
        
        outputs.title
            .asObservable()
            .bind(to: detailView.eventTitle)
            .disposed(by: disposeBag)
        
        outputs.date
            .asObservable()
            .bind(to: detailView.eventDate)
            .disposed(by: disposeBag)
        
        outputs.price
            .asObservable()
            .bind(to: detailView.price)
            .disposed(by: disposeBag)
        
        outputs.description
            .asObservable()
            .bind(to: detailView.eventDescription)
            .disposed(by: disposeBag)
        
        outputs.location
            .asObservable()
            .bind(to: detailView.mapLocation)
            .disposed(by: disposeBag)
        
        outputs.openCheckinOptions?
            .asObservable()
            .bind { event in
                self.checkinEvent?(event)
            }
            .disposed(by: disposeBag)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        
    }
    
    // MARK: - Functions
    override func loadView() {
        self.view = detailView
    }
}
