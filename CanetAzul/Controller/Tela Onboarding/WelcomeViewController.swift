//
//  Welcome.swift
//  CanetAzul
//
//  Created by Kellyane Nogueira on 21/08/20.
//  Copyright © 2020 Kellyane Nogueira. All rights reserved.
//

import Foundation
import UIKit

class WelcomeViewController: UIViewController, UIScrollViewDelegate{

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var buttonStart: UIButton!
    
    var scrollWidth: CGFloat! = 0.0
    var scrollHeight: CGFloat! = 0.0
    
    let titles = ["Feel free to explore your creativity by writing texts of your own, writing brings us many benefits.", "Need some help?"]
    let descriptions = ["Feel free to explore your creativity by writing texts of your own, writing brings us many benefits", "Search for synonyms of a word and make your text more optimized."]
    let imgs = ["Onboarding1", "Onboarding2"]
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        scrollWidth = scrollView.frame.size.width
//        scrollHeight = scrollView.frame.size.height
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.layoutIfNeeded() //to call viewDidLayoutSubviews() and get dynamic width and height of scrollview
        scrollWidth = scrollView.frame.size.width
        scrollHeight = scrollView.frame.size.height
        view.backgroundColor = UIColor(red: 0.96, green: 0.79, blue: 0.44, alpha: 1.00)
    
        configure()
        var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        for index in 0..<titles.count {
            frame.origin.x = scrollWidth * CGFloat(index)
            frame.size = CGSize(width: scrollWidth, height: scrollHeight)

            let slide = UIView(frame: frame)

            //subviews
            let imageView = UIImageView.init(image: UIImage.init(named: imgs[index]))
            imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
            imageView.contentMode = .scaleAspectFit
            imageView.center = CGPoint(x: scrollWidth/2, y: scrollHeight/2 - 50)
          
            let txt1 = UILabel.init(frame: CGRect(x: 32, y: imageView.frame.maxY+30, width: scrollWidth-64, height: 30))
            txt1.textAlignment = .center
            txt1.font = UIFont.boldSystemFont(ofSize: 20.0)
            txt1.text = titles[index]

            let txt2 = UILabel.init(frame: CGRect(x: 32, y: txt1.frame.maxY+10, width: scrollWidth-64, height: 50))
            txt2.textAlignment = .center
            txt2.numberOfLines = 3
            txt2.font = UIFont.systemFont(ofSize: 18.0)
            txt2.text = descriptions[index]

            slide.addSubview(imageView)
            slide.addSubview(txt1)
            slide.addSubview(txt2)
            scrollView.addSubview(slide)
        }

        //set width of scrollview to accomodate all the slides
        scrollView.contentSize = CGSize(width: scrollWidth * CGFloat(titles.count), height: scrollHeight)

        //disable vertical scroll/bounce
        self.scrollView.contentSize.height = 1.0

        //initial state
        pageControl.numberOfPages = titles.count
        pageControl.currentPage = 0
    }
    
    //indicator
    @IBAction func pageChanged(_ sender: Any) {
        scrollView!.scrollRectToVisible(CGRect(x: scrollWidth * CGFloat((pageControl?.currentPage)!), y: 0, width: scrollWidth, height: scrollHeight), animated: true)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        setIndiactorForCurrentPage()
    }

    func setIndiactorForCurrentPage()  {
        let page = (scrollView?.contentOffset.x)!/scrollWidth
        pageControl?.currentPage = Int(page)
    }
    
    func configure(){
        self.scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
       
    }
    
    func didTapButton(_ button: UIButton){
           // dismiss
            Core.shared.setIsNotNewUser()
            dismiss(animated: true, completion: nil)
    }
    
}
