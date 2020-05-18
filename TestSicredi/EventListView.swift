//
//  EventListView.swift
//  TestSicredi
//
//  Created by George Gomes on 16/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import UIKit
import SnapKit

protocol EventListViewComponents: UIView {
    var eventListTableView: UITableView { get }
}

class EventListView: UIView, EventListViewComponents {
    
    // MARK: - Public Variables
    lazy var eventListTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.register(EventTableViewCell.self, forCellReuseIdentifier: "EventTableViewCell")
        tableView.estimatedRowHeight = 177
        tableView.tableFooterView = UIView()
        return tableView
    }()

    //MARK: - Initializers
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.backgroundColor = .blue
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EventListView: CodeView  {

    // MARK: - Constraints Configuration
    func buildViewHierarchy() {
        self.addSubview(eventListTableView)
    }
    
    // MARK: - Constraints Configuration
    func setupConstraints() {
        eventListTableView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
    
    func setupAdditionalConfiguration() {
    }
}
