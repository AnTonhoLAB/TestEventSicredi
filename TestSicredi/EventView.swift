//
//  EventView.swift
//  TestSicredi
//
//  Created by George Gomes on 17/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol EventViewComponents: UIView {
    /// To read UI informations
    var eventDate: Binder<String?> { get }
    var eventTitle: Binder<String?> { get }
    /// To change UI informations
}

class EventCellView: UIView, EventViewComponents {
    
    lazy var eventDate: Binder<String?> = {
        return self.dateLabel.rx.text
    }()
    
    lazy var eventTitle: Binder<String?> = {
        return self.titleLabel.rx.text
    }()
    
    private lazy var bannerImageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.layer.cornerRadius = 14
        return view
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = label.font.withSize(14)
        return label
    }()
    
    private lazy var titleLabel: UILabel  = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = false
        return label
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.clipsToBounds = true
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension EventCellView: CodeView {
    
    func buildViewHierarchy() {
        self.addSubview(bannerImageView)
        self.addSubview(dateLabel)
        self.addSubview(titleLabel)
    }
    
    func setupConstraints() {
        bannerImageView.snp.makeConstraints { (make) in
            make.top.left.right .equalToSuperview()
            make.height.equalTo(180)
        }
        
        dateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(bannerImageView.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
            make.height.equalTo(16)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(dateLabel.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().inset(8)
            make.bottom.equalToSuperview().inset(10)
            make.height.greaterThanOrEqualTo(22)
        }
    }
    
    func setupAdditionalConfiguration() {
        
    }

}
