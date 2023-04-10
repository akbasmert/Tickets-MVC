//
//  OnboardingViewController.swift
//  Bilet
//
//  Created by Mert AKBAŞ on 2.04.2023.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var scroolView: UIScrollView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var currentPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.addTarget(self, action: #selector(pageChange(_:)), for: .valueChanged)
        scroolView.delegate = self
    }
    
    @objc private func pageChange(_ sender: UIPageControl) {
        let current = sender.currentPage
        scroolView.setContentOffset(CGPoint(x: CGFloat(current)*view.frame.size.width, y: 0), animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if scroolView.subviews.count == 0 {
            changeScrollView()
        }
    }
    
    private func changeScrollView() {
        scroolView.contentSize = CGSize(width: view.frame.size.width*3, height: scroolView.frame.size.height)
        scroolView.isPagingEnabled = true

        let titles: [String] = ["BİLETİM SİZİN İÇİN", "ANINDA İADE", "BEDAVA BİLET"]
        let descriptions: [String] = ["Biletim ile seyahat etmek çok kolay. Kolay kullanım, sade arayüz ve daha fazlası sizin için.", "Kalkış saatinde 30 dk öncesine kadar anında iade garantisi Biletim de.", "Her bilet satın alımınızla puan kazanaın ve kazandığnız puanlarla bilet alın."]
        let images: [String] = ["otobus", "salary", "free"]
      
        for i in 0..<3 {
            let page = UIView(frame: CGRect(x: CGFloat(i)*view.frame.size.width, y: 0, width: view.frame.size.width, height: scroolView.frame.size.height))
                scroolView.addSubview(page)
            
            let labelTitle = UILabel(frame: CGRect(x: CGFloat(i)*view.frame.size.width, y: scroolView.frame.size.height/4, width: view.frame.size.width, height: scroolView.frame.size.height))
                labelTitle.textAlignment = .center
                labelTitle.text = titles[i]
                scroolView.addSubview(labelTitle)
            
            let labelDescription = UILabel(frame: CGRect(x: CGFloat(i)*view.frame.size.width, y: scroolView.frame.size.height/3, width: view.frame.size.width, height: scroolView.frame.size.height))
                labelDescription.textAlignment = .center
                labelDescription.numberOfLines = 3
                labelDescription.frame = labelDescription.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 0, right:     10))
                labelDescription.text = descriptions[i]
                scroolView.addSubview(labelDescription)
            
            let image = UIImageView(frame: CGRect(x: CGFloat(i)*view.frame.size.width, y: 0, width: scroolView.frame.size.width, height: scroolView.frame.size.height/1.7))
                image.image = UIImage(named: images[i])
                image.contentMode = .scaleAspectFit
                scroolView.addSubview(image)
        }
    }
    
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func nextButton(_ sender: Any) {
            pageControl.currentPage += 1
            currentPage += 1
            scroolView.setContentOffset(CGPoint(x: CGFloat(pageControl.currentPage)*view.frame.size.width, y: 0), animated: true)
           
            if scroolView.subviews.count == 0 {
                changeScrollView()
            }
           
            if pageControl.currentPage == 2 {
                nextButton.setTitle("Get Started", for: .normal)
            } else {
                nextButton.setTitle("Next", for: .normal)
            }
        
        if  currentPage == 3 {
            dismiss(animated: true)
        }
    }
}

extension OnboardingViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(floor(Float(scrollView.contentOffset.x) / Float(scrollView.frame.size.width)))
        if pageControl.currentPage == 2 {
            nextButton.setTitle("Get Started", for: .normal)
            currentPage = 2
        }else{
            nextButton.setTitle("Next", for: .normal)
        }
    }
}
