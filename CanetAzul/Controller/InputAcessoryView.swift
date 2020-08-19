//
//  UITextView.swift
//  CanetAzul
//
//  Created by Kellyane Nogueira on 19/08/20.
//  Copyright © 2020 Kellyane Nogueira. All rights reserved.
//

import Foundation
import UIKit

extension UITextView{
   func addBarToKeyboard(){ //myAction:Selector?
        let Toolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
        Toolbar.isTranslucent = true
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        //let close = UIBarButtonItem(title: "Close", style: .done, target: self, action: myAction)
    let close = UIBarButtonItem(title: "Close", style: .done, target: self, action: #selector(closeToolBar))
    close.tintColor = .systemYellow
    close.image = UIImage(systemName: "clear")
    
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(close)
        
        Toolbar.items = items
        Toolbar.sizeToFit()
        
        self.inputAccessoryView = Toolbar

    }
    
    @objc func closeToolBar(){
        self.resignFirstResponder()
    }
    

}

