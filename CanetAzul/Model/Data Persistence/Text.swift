//
//  Text.swift
//  CanetAzul
//
//  Created by Kellyane Nogueira on 19/08/20.
//  Copyright © 2020 Kellyane Nogueira. All rights reserved.
//

import Foundation

struct Text: Codable{
    var id: String
    var titleText: String?
    var textBody: String
    var dateCreate: String
    
    init(titleText: String, textBody: String){
        if titleText == ""{
            self.titleText = "Untitled"
        } else {
            self.titleText = titleText
        }
        
        self.textBody = textBody
        self.id = UUID().uuidString
        
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "dd/mm/yyyy"
        self.dateCreate = format.string(from: date)
    }
}
