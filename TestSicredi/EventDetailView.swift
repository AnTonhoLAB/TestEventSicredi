//
//  EventDetailView.swift
//  TestSicredi
//
//  Created by George Gomes on 17/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

protocol EventDetailViewComponents: UIView {
    var eventImage: Binder<String?> { get }
    var eventDate: Binder<String?> { get }
    var eventTitle: Binder<String?> { get }
    var price: Binder<String?> { get }
    var eventDescription: Binder<String?> { get }
}

class EventDetailView: UIView, EventDetailViewComponents {
    // MARK: - Public Variables
    lazy var eventImage: Binder<String?> = {
        return self.imageEvent.rx.loadImage
    }()
    lazy var eventDate: Binder<String?> = {
        return self.dateLabel.rx.text
    }()
    lazy var eventTitle: Binder<String?> = {
        return self.eventTitleLabel.rx.text
    }()
    lazy var price: Binder<String?> = {
        return self.priceLabel.rx.text
    }()
    lazy var eventDescription: Binder<String?> = {
        return self.eventDescriptionTextView.rx.inputText
    }()
    
    // MARK: - Private Variables
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        return scrollView
    }()
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.axis = .vertical
        return stack
    }()
    private lazy var imageEvent: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = #imageLiteral(resourceName: "placeholder")
        return imageView
    }()
    private lazy var eventTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        return label
    }()
    private lazy var dateLabel: UILabel = {
        let label = UILabel(frame: .zero)
        return label
    }()
    private lazy var priceLabel: UILabel = {
        let label = UILabel(frame: .zero)
        return label
    }()
    private lazy var eventDescriptionTextView: UITextView = {
        let textview = UITextView(frame: .zero)
        textview.isUserInteractionEnabled = false
        return textview
    }()
    
    //MARK: - Initializers
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EventDetailView: CodeView  {

    // MARK: - Constraints Configuration
    func buildViewHierarchy() {
        self.addSubview(scrollView)
        self.scrollView.addSubview(stackView)
        self.stackView.addArrangedSubview(imageEvent)
        self.stackView.addArrangedSubview(eventTitleLabel)
        self.stackView.addArrangedSubview(priceLabel)
        self.stackView.addArrangedSubview(eventDescriptionTextView)
    }
    
    // MARK: - Constraints Configuration
    func setupConstraints() {
        scrollView.snp.makeConstraints { (make) in
           make.top.left.right.bottom.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.width.equalTo(scrollView)
            
        }
        
        imageEvent.snp.makeConstraints { (make) in
            make.height.equalTo(200)
        }
        
        eventTitleLabel.snp.makeConstraints { (make) in
            make.height.equalTo(32)
        }
        
        priceLabel.snp.makeConstraints { (make) in
            make.height.equalTo(22)
        }
        
        eventDescriptionTextView.snp.makeConstraints { (make) in
            make.height.equalTo(200)
        }
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .white
    }
}



