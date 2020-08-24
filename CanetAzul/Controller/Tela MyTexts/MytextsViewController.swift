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
    var tableView = UITableView()
    var texts: [Text] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        self.navigationItem.title = "My Texts"
        navigationController?.navigationBar.barTintColor = UIColor.init(red: 00, green: 36, blue: 70)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addText))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.init(red: 254, green: 174, blue: 0)
        //texts = textsData()
    }

    func configureTableView(){
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(PreviewCell.self, forCellReuseIdentifier: PreviewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc func addText(){
        let create = CreateViewController()
        navigationController?.pushViewController(create, animated: true)
        //        present(create,animated: true, completion: nil)
    }
    
    func appendText(text: Text){
        texts.append(text)
        tableView.reloadData()
    }
}

extension MytextsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3//texts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PreviewCell.identifier) as! PreviewCell
        //let text = texts[indexPath.row]
        var teste = Text(titleText: "My title", textBody: "bmjbvkeaghvalskdjfba;uehfiujhjAHscbkhBVD;ikdjvbkjb;wiurhgsiduvjb;iurbiubdiuebj")
        cell.isSelected = false
        //cell.backgroundColor = .clear
        cell.set(text: teste)
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let index = self.tableView.indexPathForSelectedRow{
            self.tableView.deselectRow(at: index, animated: true) //remover selecão
        }
    }

}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
