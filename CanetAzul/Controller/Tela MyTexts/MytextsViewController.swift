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
    var texts: [Text] = [Text(titleText: "t", textBody: "b")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "My Texts"
        navigationController?.navigationBar.barTintColor = UIColor.init(red: 00, green: 36, blue: 70)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addText))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.init(red: 254, green: 174, blue: 0)
        
        configureTableView()
        //navigationItem.backBarButtonItem = UIBarButtonItem(title: "Mytexts", style: .plain, target: nil, action: nil)
//        super.viewDidLoad()
//        title = "Como Doar"
//        configureTable()
//        tableView.backgroundColor = UIColor.init(named: "Bege")

        // Do any additional setup after loading the view.
    }

    func configureTableView(){
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 150
        tableView.pin(to: view)
        //let tableCellNib = UINib(nibName: ContentTableViewCell.nibname, bundle: nil)
        //tableView.register(tableCellNib, forCellReuseIdentifier: ContentTableViewCell.identifier)
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
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
    
    @objc func addText(){
        let create = CreateViewController()
        navigationController?.pushViewController(create, animated: true)
        //        present(create,animated: true, completion: nil)
    }
}

extension MytextsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10//texts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
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
