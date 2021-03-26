//
//  LikeLogics.swift
//  Stage2_Lection1a_AntonChebaniuk
//
//  Created by Anton Chebaniuk on 18.01.2021.
//

import UIKit

class LikeLogics: UIControl {
    private var likeButton = UIButton(type: .system)
    private var container: UIStackView!
    var likesPointer = UILabel()

    var likeSwitcher: Bool = false {
        didSet {
            if !oldValue {
                numberOfLikes = 1
            } else { numberOfLikes = 0 }
            Update()
        }
    }

    var numberOfLikes = 0

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLikeView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLikeView()

    }

    private func setupLikeView() {
        likeButton.setImage(UIImage(systemName: likeSwitcher ? "hand.thumbsup.fill" : "hand.thumbsup"), for: .normal)
        likeButton.tintColor = UIColor.red
        likesPointer.text = String(numberOfLikes)
        likesPointer.textColor = UIColor.red
        likeButton.addTarget(self, action: #selector(likeSwitching(_ :)), for: .touchUpInside)

        container = UIStackView(arrangedSubviews: [likeButton, likesPointer])
        addSubview(container)

        container.spacing = 2
        container.axis = .horizontal
        container.alignment = .center
        container.distribution = .equalSpacing
    }

    @objc func likeSwitching(_ sender: UIButton) {
        if likeSwitcher == false {
            likeSwitcher = true
        } else {
            likeSwitcher = false
        }
        labelAnimation()
    }
    
    private func labelAnimation() {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.5) {
            self.likesPointer.frame.origin.x += 10
        }
    }
    
    private func Update() {
        likeButton.setImage(UIImage(systemName: likeSwitcher ? "hand.thumbsup.fill" : "hand.thumbsup"), for: .normal)
        likeButton.tintColor = UIColor.red
        likesPointer.text = String(numberOfLikes)
        likesPointer.textColor = UIColor.red
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        container.frame = bounds
    }
}
