//
//  Api.swift
//  CanetAzul
//
//  Created by Kellyane Nogueira on 14/08/20.
//  Copyright © 2020 Kellyane Nogueira. All rights reserved.
//

import Foundation

//Arquivo responsável por fazer a requisição, ou seja, solicitar informações a API

enum SearchError:Error {
    case noDataAvailable
    case canNotProcessData
}

struct SearchRequest {
    let urlApi:URL
    let headers = [
        "x-rapidapi-host": "wordsapiv1.p.rapidapi.com",
        "x-rapidapi-key": "d159ef29cemsh1f46ccd91fa3450p12e15fjsn0e0c7f7b0d77"
    ]
    
    init(word: String) {
        let resourceString = "https://wordsapiv1.p.rapidapi.com/words/\(word)/synonyms"
        guard let urlApi = URL(string: resourceString) else{fatalError()}
        
        self.urlApi = urlApi

    }
   
    func getSynonyms(completion: @escaping(Result<Search, SearchError>) -> Void){
        var request = URLRequest(url: self.urlApi)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let dataTask = URLSession.shared.dataTask(with: request) {data, _, _ in
            guard let jsonData = data else{
                completion(.failure(.noDataAvailable))
                return
            }
            do {
                let decoder = JSONDecoder()
                let search = try decoder.decode(Search.self, from: jsonData)
                completion(.success(search))
            }catch{
                completion(.failure(.canNotProcessData))
            }
        }

        dataTask.resume()
    }
    
}


