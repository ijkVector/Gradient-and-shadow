//
//  ViewController.swift
//  Gradient and shadow
//
//  Created by Иван Дроботов on 01.02.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    private let shadowView = ShadowView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    private func style() {
        shadowView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        view.addSubview(shadowView)
        NSLayoutConstraint.activate([
            shadowView.widthAnchor.constraint(equalToConstant: 100),
            shadowView.heightAnchor.constraint(equalToConstant: 100),
            shadowView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            shadowView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
        ])
    }
}

