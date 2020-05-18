//
//  EventListTableViewCell.swift
//  TestSicredi
//
//  Created by George Gomes on 17/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import UIKit
import RxSwift
import SnapKit

class EventTableViewCell: UITableViewCell {
    
    // MARK: - Constants
    private let disposeBag = DisposeBag()
    
    // MARK: - Variables
    private lazy var cellView: EventCellView = {
        let view = EventCellView(frame: .zero)
        return view
    }()

    private var viewModel: EventViewModel! {
        didSet {
            setupViewModel()
        }
    }

    // Mark: - Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(cellView)
        
        selectionStyle = .none
        
        self.cellView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: - Functions
    func setup(viewModel: EventViewModel) {
        self.viewModel = viewModel
    }
    
    private func setupViewModel() {
        let outputs = viewModel.transform()
        
        outputs.title
            .asObservable()
            .bind(to: cellView.eventTitle)
            .disposed(by: disposeBag)
        
        outputs.date
            .asObservable()
            .bind(to: cellView.eventDate)
            .disposed(by: disposeBag)
        
        outputs.imageLink
            .asObservable()
            .bind(to: cellView.eventImage)
            .disposed(by: disposeBag)
    }
}
