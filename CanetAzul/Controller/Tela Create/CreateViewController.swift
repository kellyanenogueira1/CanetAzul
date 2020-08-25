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

protocol CreateTextVCDelegate: class {
    func textAdd(_ text: Text)
}

class CreateViewController: UIViewController, UITextViewDelegate {
    var imageView = UIImageView()
    var textView: UITextView = {
        let textView = UITextView()
        textView.keyboardType = .default
        textView.keyboardAppearance = .dark
        textView.isEditable = true
        textView.isScrollEnabled = true
        textView.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.light)
        textView.textColor = .blue
        textView.layer.cornerRadius = 8
        return textView
    }()
    var titleField: UITextField = {
        let titleField = UITextField()
        titleField.placeholder = "Title"
        titleField.textAlignment = .center
        titleField.keyboardType = .default
        titleField.keyboardAppearance = .dark
        titleField.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.bold)
        titleField.backgroundColor = .white
        titleField.textColor = .blue
        titleField.layer.cornerRadius = 8
        return titleField
    }()
    
    weak var delegateReferenceMyTexts: CreateTextVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        
        self.navigationItem.title = "Create"
        self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 00, green: 36, blue: 70)
        view.backgroundColor = .some(UIColor(red: 0.96, green: 0.79, blue: 0.44, alpha: 1.00))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveText))
        //navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backView))
        
        configureElements()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func configureElements(){
        viewSettings()
        titleSettings()
        textSettings()
    }
    
    func viewSettings(){
        self.view.addSubview(imageView)
        //imageView.image = UIImage(named: "background2")
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
        textView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -20),
            textView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -10),
            textView.topAnchor.constraint(equalTo: titleField.bottomAnchor, constant: 10)
        ])
        textView.addBarToKeyboard()
    }
    
    func titleSettings(){
        self.view.addSubview(titleField)
        titleField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleField.topAnchor.constraint(equalTo: self.imageView.topAnchor, constant: 10),
            titleField.heightAnchor.constraint(equalToConstant: 50),
            titleField.leadingAnchor.constraint(equalTo: self.imageView.leadingAnchor, constant: 20),
            titleField.trailingAnchor.constraint(equalTo: self.imageView.trailingAnchor, constant: -20)
        ])
        // titleField.attributedPlaceholder = NSAttributedString(string: "placeholder text",
        //attributes: [NSAttributedString.Key.foregroundColor: UIColor.yellow])
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.resignFirstResponder()
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        // swiftlint:disable force_cast
        let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        // swiftlint:enable force_cast
        self.textView.contentInset.bottom = keyboardSize.height
        self.textView.scrollIndicatorInsets = self.textView.contentInset
    }
    
    @objc func keyboardWillHide(notification: NSNotification){
        self.textView.contentInset = .zero
        self.textView.scrollIndicatorInsets = .zero
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    func alertSave(){
        let alert = UIAlertController(title: "Saved!", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
            self.dismiss(animated: true, completion: nil)
        }))
        DispatchQueue.main.async(execute: {
            self.present(alert, animated: true)
        })
        textView.text = ""
        titleField.text = ""
    }
    func alertBodyText(){
        let alert = UIAlertController(title: "Warning", message: "Please, write something in the body of your text", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in}))
        DispatchQueue.main.async(execute: {
            self.present(alert, animated: true)
        })
    }
    
    //--------------- Funções CRUD-Controller ------------------
    @objc func saveText(){
        if !(textView.text == ""){
            let textWrite = Text(titleText: titleField.text!, textBody: textView.text)
            let isCreatedOrUpdate = Storage().createFile(textWrite)
            if isCreatedOrUpdate {
                delegateReferenceMyTexts?.textAdd(textWrite)
                //navigationController?.pushViewController(delegateReferenceMyTexts!, animated: true)
                alertSave()
            } else {
                print("The text cannot be created or updated")
            }
        } else {
            alertBodyText()
        }
        
    }
    
    func showText(_ idText: String){
        let text = Storage().readFile(idText)
        titleField.text = text?.titleText
        textView.text = text?.textBody
    }
    
    func editText(){
        //Storage.updateFile(My)
    }
    
}

extension CreateViewController: UIActionSheetDelegate {
    
}
