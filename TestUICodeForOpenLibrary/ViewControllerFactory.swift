//
//  ViewControllerFactory.swift
//  TestUICodeForOpenLibrary
//
//  Created by Pavel Nesterenko on 19.05.23.
//

import Foundation
import UIKit

class ViewControllerFactory {
    static let sheard = ViewControllerFactory()
    
    func createInfoViewController() -> BookInfoViewController {
        let viewController = BookInfoViewController()
        return viewController
    }
}
