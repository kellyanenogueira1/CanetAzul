//
//  Teste.swift
//  CanetAzul
//
//  Created by Kellyane Nogueira on 22/08/20.
//  Copyright © 2020 Kellyane Nogueira. All rights reserved.
//

import Foundation
import UIKit

class TabBarController: UITabBarController{
    override func viewDidLoad() {
        super.viewDidLoad()
        //Onboarding()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if Core.shared.isNewUser(){
            // show onboarding
            //let viewcontroller = storyboard?.instantiateViewController(identifier: "welcome") as! WelcomeViewController
            let viewcontroller = WelcomeViewController()
            viewcontroller.modalPresentationStyle = .fullScreen
            present(viewcontroller, animated: true)
        }
    }
}

class Core {
    static let shared = Core()
        
    func isNewUser() -> Bool{
        return !UserDefaults.standard.bool(forKey: "isNewUser")
    }
    func setIsNotNewUser(){
        UserDefaults.standard.set(true, forKey: "isNewUser")
    }
}
