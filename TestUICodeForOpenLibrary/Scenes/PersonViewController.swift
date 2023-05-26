//
//  PersonViewController.swift
//  TestUICodeForOpenLibrary
//
//  Created by Pavel Nesterenko on 18.05.23.
//

import UIKit

class PersonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let mainView = UIView()
        mainView.backgroundColor = .black
        self.view = mainView
        setupButtonStart()
    }
    
    
    @objc func buttonStartPressed(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            self.view.backgroundColor = .systemGray
        } else {
            self.view.backgroundColor = .white
        }
       
    }
    
    func setupButtonStart() {
        let button = UIButton(type: .system)
        button.setTitle("Start", for: .normal)
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 44),
            button.widthAnchor.constraint(equalToConstant: 120)
        ])
        button.addTarget(self, action: #selector(buttonStartPressed), for: .touchUpInside)
        
    }


}
