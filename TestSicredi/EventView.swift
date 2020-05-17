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
import SnapKit

protocol EventViewComponents: UIView {
    /// To read UI informations
    var tableViewObservable: Observable<String> { get }
    /// To change UI informations
}

class EventCellView: UIView {
    
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
        return label
    }()
    
    private lazy var titleLabel: UILabel  = {
        let label = UILabel(frame: .zero)
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
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(120)
        }
        
        dateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(bannerImageView.snp.bottom).inset(16)
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().offset(8)
            make.height.equalTo(9)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(dateLabel.snp.bottom).inset(8)
            make.left.equalToSuperview().inset(8)
            make.right.equalToSuperview().offset(8)
            make.bottom.equalToSuperview()
            make.height.equalTo(22)
        }

        
    }
    
    func setupAdditionalConfiguration() {
        
    }
    
    
}
