//
//  MeustextosViewController.swift
//  CanetAzul
//
//  Created by Kellyane Nogueira on 14/08/20.
//  Copyright © 2020 Kellyane Nogueira. All rights reserved.
//

import Foundation
import UIKit

//Este arquivo será responsável por, de certo modo, conectar as view controllers passando os dados a serem resumidos até a parte de vizualização (célula da table view)

class MytextsViewController: UIViewController{
    @IBOutlet weak var tableViewTexts: UITableView!
    
//    var titleText: String
//    var preview: String
//    var creationDate: Date
//

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        title = "Como Doar"
//        configureTable()
//        tableView.backgroundColor = UIColor.init(named: "Bege")
//
//        // Do any additional setup after loading the view.
//    }
//
//    private func configureTable(){
//        let tableCellNib = UINib(nibName: ContentTableViewCell.nibname, bundle: nil)
//        tableView.register(tableCellNib, forCellReuseIdentifier: ContentTableViewCell.identifier)
//    }
//
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//
//}
//extension ComoDoarViewController: UITableViewDataSource, UITableViewDelegate{
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
//        return titles.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContentTableViewCell.identifier, for: indexPath) as? ContentTableViewCell else{
//            fatalError("Wrong identifier")
//        }
//
//        cell.labelTitle.text = titles[indexPath.row]
//        cell.contentTextView.text = contents[indexPath.row]
//        cell.imageView?.image = UIImage(named: titles[indexPath.row])
//
//        cell.backgroundColor = UIColor.clear
//        return cell
//    }
//    //IndexPath - Qual a seção e qual é a célula
}
