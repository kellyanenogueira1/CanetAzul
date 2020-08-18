//
//  CriarViewController.swift
//  CanetAzul
//
//  Created by Kellyane Nogueira on 14/08/20.
//  Copyright © 2020 Kellyane Nogueira. All rights reserved.
//

import Foundation
import UIKit

//Este arquivo é responsável por enviar os dados de organização dos elementos na view para a storyboard e receber os dados de texto criando um documento e salvando em formato .json
class CreateViewController: UIViewController{
    var imageView = UIImageView()
    var textView = UITextView()
    var titleField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSettings()
        titleSettings()
        textSettings()

    }
    
    func viewSettings(){
        self.view.addSubview(imageView)
        
        imageView.image = UIImage(named:"teste.jpg")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0)
        ])
    }
    
    func textSettings(){
        self.view.addSubview(textView)
        //textView.textColor = .yellow
        textView.becomeFirstResponder()
        textView.isEditable = true
        textView.isScrollEnabled = true
        //textView.keyboardDismissMode = .interactive
        textView.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.light)
        textView.text = "alguma coisa"
        textView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -20),
            textView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -20),
            textView.topAnchor.constraint(equalTo: titleField.bottomAnchor, constant: 10)
        ])
    }
    
    func titleSettings(){
        self.view.addSubview(titleField)
        titleField.placeholder = "Title"
        titleField.textAlignment = .center
        titleField.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.bold)
        titleField.backgroundColor = .white
        titleField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleField.topAnchor.constraint(equalTo: self.imageView.topAnchor, constant: 10),
            titleField.heightAnchor.constraint(equalToConstant: 50),
            titleField.leadingAnchor.constraint(equalTo: self.imageView.leadingAnchor, constant: 20),
            titleField.trailingAnchor.constraint(equalTo: self.imageView.trailingAnchor, constant: -20)
        ])
    }
    
   // titleField.attributedPlaceholder = NSAttributedString(string: "placeholder text", attributes: [NSAttributedString.Key.foregroundColor: UIColor.yellow])
}
