//
//  PreviewTableView.swift
//  CanetAzul
//
//  Created by Kellyane Nogueira on 17/08/20.
//  Copyright © 2020 Kellyane Nogueira. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
//    static let nibname = "PreviewTableViewCell"
//    static let identifier = "previewText"
    
    func pin(to superView: UIView){
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: 0),
            trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: 0),
            bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: 0),
            topAnchor.constraint(equalTo: superView.bottomAnchor, constant: 0)
        ])
    }
    //    var titleText: String
    //    var preview: String
    //    var creationDate: Date
    
//    override func prepareForReuse() {
//       // labelTitle.text = ""
//        //contentTextView.text = ""
//    }
//
    

}
