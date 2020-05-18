//
//  EventViewModelTsts.swift
//  TestSicrediTests
//
//  Created by George Gomes on 18/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import Foundation
import XCTest
import RxBlocking
import RxTest
import RxSwift

@testable import TestSicredi

class EventViewModelTests: XCTestCase {

    var viewModel: EventViewModel!
    var disposeBag: DisposeBag!
    var scheduler: TestScheduler!
    var events: [AppEvent]!
    var outputs: EventViewModel.Output!
     
    override func setUp() {
        super.setUp()
    
        self.scheduler = TestScheduler(initialClock: 0)
        self.disposeBag = DisposeBag()
        
        let path = Bundle(for: type(of: self)).url(forResource: "EventListStub", withExtension: "json")!
        let data = try! Data(contentsOf: path)
        let events = try! Decoder.decodeObject(type: [AppEvent].self, from: data)
          
        self.viewModel = EventViewModel(event: events[0])
        self.outputs = viewModel.transform()
    }
    
    func testTitle() {
        let observer: TestableObserver<String?> = scheduler.createObserver(String?.self)
        
        let correctResult: [Recorded<RxSwift.Event<String?>>] = [
            Recorded.next(0, "Feira de adoção de animais na Redenção")
        ]

        outputs.title
            .asObservable()
            .bind(to: observer)
            .disposed(by: disposeBag)
           
        scheduler.start()
        XCTAssertEqual(correctResult, observer.events)
    }
    
    func testImageLink() {
        let observer: TestableObserver<String?> = scheduler.createObserver(String?.self)
        
        let correctResult: [Recorded<RxSwift.Event<String?>>] = [
            Recorded.next(0, "http://lproweb.procempa.com.br/pmpa/prefpoa/seda_news/usu_img/Papel%20de%20Parede.png")
        ]

        outputs.imageLink
            .asObservable()
            .bind(to: observer)
            .disposed(by: disposeBag)
           
        scheduler.start()
        XCTAssertEqual(correctResult, observer.events)
    }
    
    func testDate() {let observer: TestableObserver<String?> = scheduler.createObserver(String?.self)
        
        let correctResult: [Recorded<RxSwift.Event<String?>>] = [
            Recorded.next(0, "20 de ago de 2018")
        ]

        outputs.date
            .asObservable()
            .bind(to: observer)
            .disposed(by: disposeBag)
           
        scheduler.start()
        XCTAssertEqual(correctResult, observer.events)
    }
    
    func testPrice() {
        let observer: TestableObserver<String?> = scheduler.createObserver(String?.self)
        
        let correctResult: [Recorded<RxSwift.Event<String?>>] = [
            Recorded.next(0, "R$ 29.99")
        ]

        outputs.price
            .asObservable()
            .bind(to: observer)
            .disposed(by: disposeBag)
           
        scheduler.start()
        XCTAssertEqual(correctResult, observer.events)
    }
    
    func testDescription() {
        let observer: TestableObserver<String?> = scheduler.createObserver(String?.self)
        
        let correctResult: [Recorded<RxSwift.Event<String?>>] = [
            Recorded.next(0, "O Patas Dadas estará na Redenção, nesse domingo, com cães para adoção e produtos à venda!\n\nNa ocasião, teremos bottons, bloquinhos e camisetas!\n\nTraga seu Pet, os amigos e o chima, e venha aproveitar esse dia de sol com a gente e com alguns de nossos peludinhos - que estarão prontinhos para ganhar o ♥ de um humano bem legal pra chamar de seu. \n\nAceitaremos todos os tipos de doação:\n- guias e coleiras em bom estado\n- ração (as que mais precisamos no momento são sênior e filhote)\n- roupinhas \n- cobertas \n- remédios dentro do prazo de validade")
        ]

        outputs.description
            .asObservable()
            .bind(to: observer)
            .disposed(by: disposeBag)
           
        scheduler.start()
        XCTAssertEqual(correctResult, observer.events)
    }
    
    func testLocation() {
        let observer: TestableObserver<Double> = scheduler.createObserver(Double.self)
        
        let correctResult: [Recorded<RxSwift.Event<Double>>] = [
            Recorded.next(0, -30.0392981)
        ]

        outputs.location
            .asObservable()
            .map { $0.0 }
            .bind(to: observer)
            .disposed(by: disposeBag)
           
        scheduler.start()
        XCTAssertEqual(correctResult, observer.events)
    }
    
}

