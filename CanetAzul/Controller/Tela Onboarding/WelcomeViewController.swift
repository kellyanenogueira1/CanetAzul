//
//  Welcome.swift
//  CanetAzul
//
//  Created by Kellyane Nogueira on 21/08/20.
//  Copyright © 2020 Kellyane Nogueira. All rights reserved.
//

import Foundation
import UIKit

class WelcomeViewController: UIViewController{
    @IBOutlet var holderView: UIView!
    let imageOnboarding = UIImageView()
    let buttonNext = UIButton()
    let labelText = UILabel()
    let scrollview = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configure()
    }
    private func configure(){
        //set up view srollview
        self.scrollview.frame = holderView.bounds
        self.holderView.addSubview(scrollview)
        
        let titles = ["Welcome! Feel free to explore your creativity by writing texts of your own, writing brings us many benefits.", "Need some help? Search for synonyms of a word and make your text more optimized."]
        
        for index in 1..<3 {
            let pageView = UIView(frame: CGRect(x: CGFloat(index) * holderView.frame.size.width, y: 0, width: holderView.frame.size.width, height: holderView.frame.size.height))
            scrollview.addSubview(pageView)
            imageSettings()
            labelSettings()
            buttonSettings()
            labelText.text = titles[index]
            imageOnboarding.image = UIImage(named: "onboarding\(index).png")
            buttonNext.setTitle("Next", for: .normal)
            if index == 2 {
                buttonNext.setTitle("Get Started", for: .normal)
            }
            buttonNext.tag = index+1
            scrollview.contentSize = CGSize(width: holderView.frame.size.width*3, height: 0)
            scrollview.isPagingEnabled = true
        }
    }
    
    func imageSettings(){
        self.view.addSubview(imageOnboarding)
        imageOnboarding.contentMode = .scaleAspectFit
        imageOnboarding.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageOnboarding.centerYAnchor.constraint(equalTo: holderView.centerYAnchor),
            imageOnboarding.centerXAnchor.constraint(equalTo: holderView.centerXAnchor)
        ])
    }
    
    func labelSettings(){
        self.view.addSubview(labelText)
        labelText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        labelText.centerXAnchor.constraint(equalTo: holderView.centerXAnchor),
        labelText.topAnchor.constraint(equalTo: imageOnboarding.bottomAnchor, constant: 20)
        //labelText.bottomAnchor.constraint(equalTo: holderView.bottomAnchor, constant: -10)
        ])
        labelText.textAlignment = .center
        labelText.font = UIFont(name: "Helvetica-Bold", size: 32)
    }
    
    func buttonSettings(){
        self.view.addSubview(buttonNext)
        buttonNext.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonNext.centerXAnchor.constraint(equalTo: holderView.centerXAnchor),
            //buttonNext.topAnchor.constraint(equalTo: labelText.bottomAnchor, constant: 40),
            buttonNext.bottomAnchor.constraint(equalTo: holderView.bottomAnchor, constant: -10)
        ])
        buttonNext.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        buttonNext.setTitleColor(.white, for: .normal)
        buttonNext.backgroundColor = .black
    }
    
    @objc func didTapButton(_ button: UIButton){
        guard button.tag < 2 else{
            //dismiss
            Core.shared.setIsNotNewUser()
            dismiss(animated: true, completion: nil)
            return
        }
        //scroll to next page
        scrollview.setContentOffset(CGPoint(x: holderView.frame.size.width * CGFloat(button.tag), y: 0), animated: true)
    }
    
}
