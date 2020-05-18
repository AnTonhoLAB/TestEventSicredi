//
//  ViewController+Alert.swift
//  TestSicredi
//
//  Created by George Gomes on 17/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func alertSimpleWarning(title: String, message: String, action:((UIAlertAction) -> Void)?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: action)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func alertSimpleMessage(message: String, action: ((UIAlertAction) -> Void)?) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: action)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
}
