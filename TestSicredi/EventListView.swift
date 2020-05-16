//
//  EventListView.swift
//  TestSicredi
//
//  Created by George Gomes on 16/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import UIKit

protocol EventListViewComponents: UIView {
    /// To read UI informations
    var sicrediButton: UIButton { get }
}

class EventListView: UIView, EventListViewComponents {
    lazy var sicrediButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .red
        view.setTitle("Teste Sicredi", for: .normal)
        view.backgroundColor = #colorLiteral(red: 0.7967856526, green: 0.2607563436, blue: 0.1506694257, alpha: 1)
        return view
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
    func buildViewHierarchy() {
        self.addSubview(sicrediButton)
    }
    
    func setupConstraints() {
        self.sicrediButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.sicrediButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.sicrediButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.sicrediButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        self.sicrediButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .blue
    }
}

protocol CodeView {
    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
    func setupView()
}

//code template
extension CodeView {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
}
