//
//  CriarViewController.swift
//  CanetAzul
//
//  Created by Kellyane Nogueira on 14/08/20.
//  Copyright © 2020 Kellyane Nogueira. All rights reserved.
//

import Foundation
import UIKit

//Este arquivo é responsável por enviar os dados de organização dos elementos na view para a storboard e receber os dados de texto criando um documento e salvando em formato .json 
class CreateViewController: UIViewController{
    var documentText = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func viewSettings(){
        self.view.addSubview(documentText)
        
    }
}
