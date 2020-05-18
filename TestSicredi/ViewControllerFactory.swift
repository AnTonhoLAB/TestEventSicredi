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
    func instantiateEventDetailViewController(event: Event) -> EventDetailViewController
    func instantiateEventCheckin(event: Event) -> CheckInViewController
    func instantiateViewModel(event: Event) -> EventViewModel 
}

class ViewControllerFactory: ViewControllerFactoryProtocol {
    func instantiateEventListViewController() -> EventListViewController {
        let eventListView = EventListView()
        let eventListRequester = EventListRequester(nil)
        let eventListUseCase = EventListUsecase(eventListRequester: eventListRequester)
        let eventListViewModel = EventListViewModel(eventListUsecaseProtocol: eventListUseCase)
        return EventListViewController(with: eventListView, viewModel: eventListViewModel)
    }
    
    func instantiateEventDetailViewController(event: Event) -> EventDetailViewController  {
        let eventDetailView = EventDetailView()
        let eventDetailViewModel = EventViewModel(event: event)
        let eventDetailViewController = EventDetailViewController(with: eventDetailView, viewModel: eventDetailViewModel)
        return eventDetailViewController
    }
    
    func instantiateEventCheckin(event: Event) -> CheckInViewController {
        let checkinView = CheckInView()
        let checkinRequester = EventCheckinRequester(nil)
        let checkinUseCase = CheckinUseCase(checkinRequester: checkinRequester)
        let checkinViewModel = CheckInViewModel(checkInUsecaseProtocol: checkinUseCase, event: event)
        let checkinViewController = CheckInViewController(with: checkinView, viewModel: checkinViewModel)
        return checkinViewController
    }
    
    func instantiateViewModel(event: Event) -> EventViewModel {
        let eventViewModel = EventViewModel(event: event)
        return eventViewModel
    }
}
