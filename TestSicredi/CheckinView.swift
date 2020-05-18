//
//  CheckinView.swift
//  TestSicredi
//
//  Created by George Gomes on 18/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

protocol CheckInViewComponents: UIView {
    var name: Observable<String> { get }
    var email: Observable<String> { get }
    var didTapCheckin: Observable<Void> { get }
}

class CheckInView: UIView, CheckInViewComponents {
    
    // MARK: - Public Variables
    lazy var name: Observable<String> = {
        return self.nameField.rx.text.orEmpty.asObservable()
    }()
    lazy var email: Observable<String> = {
        return self.emailField.rx.text.orEmpty.asObservable()
    }()
    lazy var didTapCheckin: Observable<Void> = {
        return self.checkinButton.rx.tap.asObservable()
    }()
    
    // MARK: - Private Variables
    private lazy var checkinButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setImage(#imageLiteral(resourceName: "checkin"), for: .normal)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.imageEdgeInsets.left = 4
        button.imageEdgeInsets.right = 4
        button.imageEdgeInsets.top = 4
        button.imageEdgeInsets.bottom = 4
        return button
    }()
    private lazy var nameField: UITextField = {
        let field = UITextField(frame: .zero)
        field.borderStyle = .roundedRect
        field.placeholder = "Nome"
        return field
    }()
    private lazy var emailField: UITextField = {
        let field = UITextField(frame: .zero)
        field.borderStyle = .roundedRect
        field.placeholder = "Email"
        return field
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

extension CheckInView: CodeView  {

    // MARK: - Constraints Configuration
    func buildViewHierarchy() {
        self.addSubview(checkinButton)
        self.addSubview(nameField)
        self.addSubview(emailField)
    }
    
    // MARK: - Constraints Configuration
    func setupConstraints() {

        checkinButton.snp.makeConstraints { (make) in
            make.top.equalTo(emailField.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(50)
        }
        
        nameField.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(180)
            make.left.equalToSuperview().offset(60)
            make.right.equalToSuperview().inset(60)
        }
        
        emailField.snp.makeConstraints { (make) in
            make.top.equalTo(nameField.snp.bottom).offset(16)
            make.left.equalTo(nameField)
            make.right.equalTo(nameField)
        }
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .white
    }
}
