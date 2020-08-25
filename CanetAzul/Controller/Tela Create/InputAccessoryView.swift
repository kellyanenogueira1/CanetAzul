//
//  UITextView.swift
//  CanetAzul
//
//  Created by Kellyane Nogueira on 19/08/20.
//  Copyright © 2020 Kellyane Nogueira. All rights reserved.
//

import Foundation
import UIKit

extension UITextView {
   func addBarToKeyboard(){ //myAction:Selector?
        let toolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
        toolbar.isTranslucent = true
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let close = UIBarButtonItem(title: "Close", style: .done, target: self, action: #selector(closeToolBar))
        close.tintColor = .systemOrange
        close.image = UIImage(systemName: "clear")
    
//        let color = UIBarButtonItem(title: "Color", style: .done, target: self, action: #selector(changeColor))
//        close.tintColor = .systemOrange
//        close.image = UIImage(systemName: "pencil.tip.crop.circle")
//
//        let typography = UIBarButtonItem(title: "Letter", style: .done, target: self, action: #selector(changeLetter))
//        close.tintColor = .systemOrange
//        close.image = UIImage(systemName: "textformat.alt")
       
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(close)
//        items.append(color)
//        items.append(typography)
        
        toolbar.items = items
        toolbar.sizeToFit()
        
        self.inputAccessoryView = toolbar

    }
    
    @objc func closeToolBar(){
        self.resignFirstResponder()
    }
    @objc func changeColor(){
        
    }
    @objc func changeLetter(){
        
    }

}
