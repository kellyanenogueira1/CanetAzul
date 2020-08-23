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
            leadingAnchor.constraint(equalTo: superView.leadingAnchor),
            trailingAnchor.constraint(equalTo: superView.trailingAnchor),
            bottomAnchor.constraint(equalTo: superView.bottomAnchor),
            topAnchor.constraint(equalTo: superView.bottomAnchor)
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
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        //applyShadow()
//        self.selectionStyle = .none
//    }
    
//    func applyShadow() {
//        //Deixando o shadow passar das fronteiras da mascara da layer da contentView da celula
//        self.contentView.layer.masksToBounds = false
//        
//        comoDoarImageView.layer.cornerRadius = 12.0
//        comoDoarImageView.layer.shadowColor = UIColor.black.cgColor
//        comoDoarImageView.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
//        comoDoarImageView.layer.shadowRadius = 8.0
//        comoDoarImageView.layer.shadowOpacity = 0.2
//    }
}
