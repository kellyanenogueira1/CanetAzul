//
//  ApiModel.swift
//  CanetAzul
//
//  Created by Kellyane Nogueira on 14/08/20.
//  Copyright © 2020 Kellyane Nogueira. All rights reserved.
//

import Foundation

//Estrutura de resposta da Api (Como os dados virão)

struct Search:Codable{
    var synonyms: [String]
}

