//
//  Reactive.swift
//  TestSicredi
//
//  Created by George Gomes on 17/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base : UIButton {
   public var valid : Binder<Bool> {
        return Binder(self.base) { button, valid in
            button.isEnabled = valid
            button.setTitleColor(valid ? .white : .black, for: .normal)
        }
    }
}

extension Reactive where Base : UpdatableViewController {
    var loadingState : Binder<NetworkingState<Any>> {
        return Binder(self.base) { vc, state in
           switch state {
            case .loading:
                vc.showLoading()
            case .success:
                vc.removeLoading()
            case .fail(let error):
                print(error)
                vc.removeLoading()
            case .default:
                break
            }
        }
    }

    var loadWarning : Binder<NetworkingState<Any>> {
           return Binder(self.base) { vc, state in
              switch state {
               case .loading:
                   vc.showLoading()
               case .success:
                   vc.removeLoading()
               case .fail(let error):
                   print(error)
                   vc.removeLoading()
               case .default:
                   break
               }
           }
       }
}

class UpdatableViewController: UIViewController {
       private var loadView : UIView?
}

extension UpdatableViewController {

    func showLoading() {
        let wallView = UIView.init(frame: self.view.bounds)
        wallView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let indicator = UIActivityIndicatorView.init(style: UIActivityIndicatorView.Style.large)
        indicator.startAnimating()
        indicator.center = wallView.center

        DispatchQueue.main.async {
            wallView.addSubview(indicator)
            self.view.addSubview(wallView)
        }

        loadView = wallView
    }

    func removeLoading() {
        DispatchQueue.main.async {
            self.loadView?.removeFromSuperview()
            self.loadView = nil
        }
    }
}

