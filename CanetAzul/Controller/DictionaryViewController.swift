//
//  DictionaryViewController.swift
//  CanetAzul
//
//  Created by Kellyane Nogueira on 14/08/20.
//  Copyright © 2020 Kellyane Nogueira. All rights reserved.
//

import Foundation
import UIKit

//Esse arquivo será responsável por receber o dados da api para manipulá-los e enviar para a view com as intruções de como é mais adequado mostrar esses dados ao usuário

class DictionaryViewController:UIViewController{
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var textViewDictionary: UITextView!
    
    var count = 0
    
    var listOfSynonyms: Search?{
        didSet {
            DispatchQueue.main.async {
                //atualizar dados aqui
                self.addTextInView()
                
                self.textViewDictionary.reloadInputViews()
            }
        }
    }
    
    //1. Iterar listOfSynonyms.synonyms
    //2. Add no text view (appendar)
    //3.Limpar view
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
//        let teste = SearchRequest(word: "lovely")
//        teste.getSynonyms { (search) in
//            print(search)
//        }
    }
    
    func addTextInView(){
        textViewDictionary.text = ""
        textViewDictionary.insertText("Synonyms found:\n")
        for word in listOfSynonyms!.synonyms{
            count = count+1
            textViewDictionary.insertText( "\(count). \(word)\n")
        }
        count = 0
    }
    

}

extension DictionaryViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchBarText = searchBar.text else {return}
        let searchRequest = SearchRequest(word: searchBarText)
        searchRequest.getSynonyms{[weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let synonyms):
                self?.listOfSynonyms = synonyms
            }
        }
    }
}
