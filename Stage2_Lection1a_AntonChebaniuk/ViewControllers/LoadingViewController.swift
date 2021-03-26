//
//  LoadingViewController.swift
//  Stage2_Lection1a_AntonChebaniuk
//
//  Created by Anton Chebaniuk on 01.02.2021.
//

import UIKit

class LoadingProgressBar: UIView {
    let bar1 = UIView(frame: CGRect(x: 143, y: 380, width: 20, height: 20))
    let bar2 = UIView(frame: CGRect(x: 173, y: 380, width: 20, height: 20))
    let bar3 = UIView(frame: CGRect(x: 203, y: 380, width: 20, height: 20))
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.addSubview(bar1)
        self.addSubview(bar2)
        self.addSubview(bar3)
        
        self.backgroundColor = UIColor.lightGray
        
        bar1.backgroundColor = self.backgroundColor
        bar1.layer.cornerRadius = bar1.layer.frame.size.width / 2
        bar1.alpha = 0.2
        
        bar2.backgroundColor = self.backgroundColor
        bar2.layer.cornerRadius = bar2.layer.frame.size.width / 2
        bar2.alpha = 0.2
        
        bar3.backgroundColor = self.backgroundColor
        bar3.layer.cornerRadius = bar3.layer.frame.size.width / 2
        bar3.alpha = 0.2
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

var loadingProgressBar = LoadingProgressBar()


class LoadingViewController: UIViewController {
    
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(loadingProgressBar)
        progressBarAnimation()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        sleep(5)
        performSegue(withIdentifier: "loading_to_login", sender: self)
    }
    
    
    func progressBarAnimation() {
        
        UIView.animate(withDuration: 0.5, delay: 0.3, options: [.repeat, .autoreverse]) {
            loadingProgressBar.bar1.alpha = 1
            self.view.layoutIfNeeded()
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.6, options: [.repeat, .autoreverse]) {
            loadingProgressBar.bar2.alpha = 1
            self.view.layoutIfNeeded()
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.9, options: [.repeat, .autoreverse]) {
            loadingProgressBar.bar3.alpha = 1
            self.view.layoutIfNeeded()
        }
        
    }
}
