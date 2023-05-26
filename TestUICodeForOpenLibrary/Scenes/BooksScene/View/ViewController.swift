//
//  ViewController.swift
//  TestUICodeForOpenLibrary
//
//  Created by Pavel Nesterenko on 15.05.23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let mainView = UIView()
        self.view = mainView
        let tableViewController = MyTableTableViewController(style: .plain)
        addChild(tableViewController)
        view.addSubview(tableViewController.view)
        tableViewController.didMove(toParent: self)
          
    }
    

}


