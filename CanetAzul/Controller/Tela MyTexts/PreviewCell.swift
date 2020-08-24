//
//  PreviewCell.swift
//  CanetAzul
//
//  Created by Kellyane Nogueira on 23/08/20.
//  Copyright © 2020 Kellyane Nogueira. All rights reserved.
//

import UIKit

class PreviewCell: UITableViewCell {
    let imageBackground: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        //imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    var previewTitle = UILabel()
    var previewText = UILabel()
    var dateCreate = UILabel()
    
    static let identifier = "idCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(imageBackground)
        addSubview(previewTitle)
        addSubview(previewText)
        addSubview(dateCreate)
        configureElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(text: Text){
        imageBackground.image = UIImage(named: "Image")
        //imageBackground.backgroundColor = UIColor(red: 0.96, green: 0.79, blue: 0.44, alpha: 1.00)
        previewTitle.text = text.titleText
        previewText.text = text.textBody
        dateCreate.text = text.dateCreate
    }
    
    func configureElements(){
        //applyShadow()
        setImageConstraints()
        configureLabels()
        setPreviewText()
        setPreviewTitle()
        setDateCreate()
    }
    
    func configureLabels(){
        previewTitle.numberOfLines = 1
        previewTitle.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.bold)
        previewText.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.light)
        dateCreate.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.light)
        //previewTitle.adjustsFontSizeToFitWidth = true
    }
    
    func setImageConstraints(){
        imageBackground.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageBackground.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            imageBackground.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            imageBackground.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            imageBackground.topAnchor.constraint(equalTo: topAnchor, constant: 8)
        ])
    }
    
    func setPreviewTitle(){
        previewTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            previewTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            previewTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            previewTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 10)
            //previewText.bottomAnchor.constraint(equalTo: previewTitle.bottomAnchor, constant: -5)
        ])
    }
    
    func setPreviewText(){
        previewText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            previewText.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            previewText.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            previewText.topAnchor.constraint(equalTo: previewTitle.bottomAnchor, constant: 8)
            //previewText.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func setDateCreate(){
        dateCreate.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateCreate.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            dateCreate.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            dateCreate.topAnchor.constraint(equalTo: previewText.bottomAnchor, constant: 52),
            dateCreate.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8)
        ])
    }
}
