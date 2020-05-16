//
//  ViewController+Presentable.swift
//  TestSicredi
//
//  Created by George Gomes on 16/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//
import UIKit
//import RxSwift
//import RxCocoa

extension UIViewController: Presentable {
    func toPresent() -> UIViewController {
        return self
    }
}
