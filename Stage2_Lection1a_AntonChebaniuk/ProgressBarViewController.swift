//
//  ProgressBarViewController.swift
//  Stage2_Lection1a_AntonChebaniuk
//
//  Created by Anton Chebaniuk on 29.01.2021.
//

import UIKit

class ProgressBarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var container = UIStackView()
        
        let circle = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        circle.backgroundColor = UIColor.lightGray
        circle.layer.cornerRadius = circle.frame.size.width / 2
        
        let circle2 = UIView(frame: CGRect(x: 70, y: 70, width: 20, height: 20))
        circle2.backgroundColor = UIColor.lightGray
        circle2.layer.cornerRadius = circle.frame.size.width / 2
        
        container = UIStackView(arrangedSubviews: [circle, circle2])
        view.addSubview(container)
        container.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    }
    
    
}
