//
//  AnimateViewController.swift
//  Stage2_Lection1a_AntonChebaniuk
//
//  Created by Anton Chebaniuk on 27.01.2021.
//

import UIKit

class CircleProgressBar: UIView {
    let bar1 = UIView(frame: CGRect(x: 143, y: 200, width: 20, height: 20))
    let bar2 = UIView(frame: CGRect(x: 173, y: 200, width: 20, height: 20))
    let bar3 = UIView(frame: CGRect(x: 203, y: 200, width: 20, height: 20))
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.addSubview(bar1)
        self.addSubview(bar2)
        self.addSubview(bar3)
        
        self.backgroundColor = UIColor.lightGray
        
        bar1.backgroundColor = self.backgroundColor
        bar1.layer.cornerRadius = bar1.layer.frame.size.width / 2
        
        bar2.backgroundColor = self.backgroundColor
        bar2.layer.cornerRadius = bar2.layer.frame.size.width / 2
        
        bar3.backgroundColor = self.backgroundColor
        bar3.layer.cornerRadius = bar3.layer.frame.size.width / 2
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

var progressBar = CircleProgressBar()

class AnimateViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var centerXConstraint: NSLayoutConstraint!
    @IBOutlet weak var centerYConstraint: NSLayoutConstraint!
    
    let operationalBarView = UIView(frame: CGRect(x: 157, y: 398, width: 50, height: 50))
    let operationalCircleView = UIView(frame: CGRect(x: 157, y: 398, width: 70, height: 70))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(progressBar)
        
        operationalBarView.backgroundColor = UIColor.blue
        view.addSubview(operationalBarView)
        operationalBarView.center = CGPoint(x: view.frame.size.width / 2, y: view.frame.size.height / 2)
        
        operationalCircleView.backgroundColor = UIColor.magenta
        
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            self.operationalBarView.frame.origin.y -= 100
        }
        UIView.animate(withDuration: 0.5, delay: 0.5, options: [.repeat, .autoreverse]) {
            self.operationalBarView.alpha = 0.2
        }
    }
    
    @IBAction func animation2(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            self.centerXConstraint.constant -= 50
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func defaultPosition(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseIn]) {
            self.centerXConstraint.constant = 0
            self.centerYConstraint.constant = 0
            self.operationalBarView.center = CGPoint(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 2)
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func animation3(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0.5, options: [.repeat, .autoreverse]) {
            self.operationalBarView.layer.cornerRadius = self.operationalBarView.frame.width / 2
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func animation4(_ sender: UIButton) {
        UIView.transition(with: operationalBarView, duration: 0.5, options: [.repeat, .transitionCrossDissolve]) {
            self.operationalBarView.frame.size = CGSize(width: 50, height: 100)
        }
    }
    
    @IBAction func animation5(_ sender: UIButton) {
        UIView.transition(from: operationalBarView, to: operationalCircleView, duration: 0.5, options: [.transitionFlipFromLeft])
    }
    
    @IBAction func animation6(_ sender: UIButton) {
        let animation = CABasicAnimation(keyPath: "position.y")
        animation.fromValue = operationalBarView.layer.frame.minY
        animation.toValue = operationalBarView.layer.frame.minY - 100
        animation.duration = 0.5
        operationalBarView.layer.add(animation, forKey: nil)
    }
    
    @IBAction func animation7(_ sender: UIButton) {
        let animation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        animation.beginTime = CACurrentMediaTime() + 1
        animation.fromValue = 0.5
        animation.toValue = 0.1
        animation.duration = 0.5
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        progressBar.bar1.layer.add(animation, forKey: nil)
//        operationalBarView.layer.add(animation, forKey: nil)
    }
    
    
    @IBAction func animation8(_ sender: UIButton) {
        
        for _ in 0...10 {
            
            UIView.animate(withDuration: 0.3, delay: 0.1) {
                progressBar.bar1.alpha = 0.2
                progressBar.bar3.alpha = 1
                self.view.layoutIfNeeded()
            } completion: { (_) in
                UIView.animate(withDuration: 0.3, delay: 0.1) {
                    progressBar.bar2.alpha = 0.2
                    progressBar.bar1.alpha = 1
                    self.view.layoutIfNeeded()
                } completion: { (_) in
                    UIView.animate(withDuration: 0.3, delay: 0.1) {
                        progressBar.bar3.alpha = 0.2
                        progressBar.bar2.alpha = 1
                        self.view.layoutIfNeeded()
                        
                    }
                }
            }
        }
    }
    
    @IBAction func animation9(_ sender: UIButton) {
        //        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: [.repeat, .autoreverse]) {
        //            self.operationalBarView.frame.origin.x += 100
        //        }
        UIView.animate(withDuration: 0.1, delay: 0) {
            self.operationalBarView.frame.size = CGSize(width: 60, height: 60)
        } completion: { (_) in
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.5) {
                self.operationalBarView.frame.size = CGSize(width: 50, height: 50)
            }
        }
    }
    
    @IBAction func animation10(_ sender: UIButton) {
//        operationalBarView.transform = CGAffineTransform(rotationAngle: 45)
//        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [.curveEaseOut]){
//            self.operationalBarView.transform = .identity
//        }
        
        operationalBarView.transform = CGAffineTransform(rotationAngle: 45)
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [.curveEaseOut]){
            self.operationalBarView.transform = .identity
        }
    }
    
    @IBAction func animation11(_ sender: UIButton) {
    }
    
    @IBAction func animation12(_ sender: UIButton) {
    }
}
