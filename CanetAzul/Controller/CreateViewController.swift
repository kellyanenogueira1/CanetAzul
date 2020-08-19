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
class CreateViewController: UIViewController, UITextViewDelegate {
    var imageView = UIImageView()
    var textView = UITextView()
    var titleField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        viewSettings()
        titleSettings()
        textSettings()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

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
        //textView.enablesReturnKeyAutomatically = true //becomeFirstResponder()
        textView.keyboardType = .default
        textView.keyboardAppearance = .dark
        textView.isEditable = true
        textView.isScrollEnabled = true
        textView.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.light)
        textView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -20),
            textView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -10),
            textView.topAnchor.constraint(equalTo: titleField.bottomAnchor, constant: 10)
        ])
        //textView.addBarToKeyboard(myAction: #selector(self.textView.resignFirstResponder))
        textView.addBarToKeyboard()
    }
    
    func titleSettings(){
        self.view.addSubview(titleField)
        titleField.placeholder = "Title"
        titleField.textAlignment = .center
        titleField.keyboardType = .default
        titleField.keyboardAppearance = .dark
        titleField.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.bold)
        titleField.backgroundColor = .white
        titleField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleField.topAnchor.constraint(equalTo: self.imageView.topAnchor, constant: 10),
            titleField.heightAnchor.constraint(equalToConstant: 50),
            titleField.leadingAnchor.constraint(equalTo: self.imageView.leadingAnchor, constant: 20),
            titleField.trailingAnchor.constraint(equalTo: self.imageView.trailingAnchor, constant: -20)
        ])
        // titleField.attributedPlaceholder = NSAttributedString(string: "placeholder text", attributes: [NSAttributedString.Key.foregroundColor: UIColor.yellow])
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.resignFirstResponder()
      }
    
    @objc func keyboardWillShow(notification: NSNotification){
        let keyboardSize = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        self.textView.contentInset.bottom = keyboardSize.height
        self.textView.scrollIndicatorInsets = self.textView.contentInset;
    }
    
    @objc func keyboardWillHide(notification: NSNotification){
        self.textView.contentInset = .zero
        self.textView.scrollIndicatorInsets = .zero
    }
    
}

