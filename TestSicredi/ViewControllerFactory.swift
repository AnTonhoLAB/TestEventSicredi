//
//  ViewControllerFactory.swift
//  TestSicredi
//
//  Created by George Gomes on 16/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import Foundation

protocol ViewControllerFactoryProtocol {
    func instantiateEventListViewController() -> EventListViewController
}

class ViewControllerFactory: ViewControllerFactoryProtocol {
    func instantiateEventListViewController() -> EventListViewController {
        let eventListView = EventListView()
        let eventListRequester = EventListRequester(nil)
        let eventListUseCase = EventListUsecase(eventListRequester: eventListRequester)
        let eventListViewModel = EventListViewModel(eventListUsecaseProtocol: eventListUseCase)
        return EventListViewController(with: eventListView, viewModel: eventListViewModel)
    }
    
    func instantiateEventDetailViewController() -> EventDetailViewController  {
        let eventDetailView = EventDetailView()
        let eventDetailViewModel = EventDetailViewModel()
        let eventDetailViewController = EventDetailViewController(with: eventDetailView, viewModel: eventDetailViewModel)
        return eventDetailViewController
    }
    
    func instantiateViewModel(event: Event) -> EventViewModel {
        let eventListRequester = EventListRequester(nil)
        let eventListUseCase = EventListUsecase(eventListRequester: eventListRequester)
        let eventViewModel = EventViewModel(eventListUsecaseProtocol: eventListUseCase, event: event)
        return eventViewModel
    }
}
