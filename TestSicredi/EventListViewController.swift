//
//  ListViewController.swift
//  TestSicredi
//
//  Created by George Gomes on 16/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import UIKit

class EventListViewController: UIViewController {
    
    private var eventListView: EventListViewComponents!
    
    init(with view: EventListViewComponents) {
        super.init(nibName: nil, bundle: nil)
        self.eventListView = view
    }
    
    override func loadView() {
        self.view = eventListView
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
