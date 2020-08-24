//
//  LaunchScreen.swift
//  CanetAzul
//
//  Created by Kellyane Nogueira on 22/08/20.
//  Copyright © 2020 Kellyane Nogueira. All rights reserved.
//

import Foundation
import UIKit

class LaunchScreen: UIViewController {
    var img = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        img.image = UIImage(named: "onboarding1.png")
        img.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            img.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            img.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
