//
//  LaunchInstructor.swift
//  TestSicredi
//
//  Created by George Gomes on 16/05/20.
//  Copyright © 2020 George Gomes. All rights reserved.
//

import Foundation

import Foundation

fileprivate var userInformationWasShown = true

enum LaunchInstructorProtocol {
    case list
    case userInformation
}

class LaunchInstructor {
    
    func configure( userInformationWasShown: Bool = userInformationWasShown) -> LaunchInstructorProtocol {
        switch (userInformationWasShown) {
        case (true): return .list
        case (false): return .userInformation
        }
    }
}
