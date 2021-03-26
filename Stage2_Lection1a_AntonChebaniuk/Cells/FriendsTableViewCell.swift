//
//  FriendsTableViewCell.swift
//  Stage2_Lection1a_AntonChebaniuk
//
//  Created by Anton Chebaniuk on 28.12.2020.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var friendsLabel: UILabel!
    @IBOutlet weak var friendsImageView: UIImageView!
    @IBOutlet weak var photoView: UIImageView!
    
    @objc func tapOnPhotoToAnimate(_ sender: UIGestureRecognizer) {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.5) {
            self.friendsImageView.bounds.size = CGSize(width: 84, height: 84)
        } completion: { (_) in
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.5) {
                self.friendsImageView.bounds.size = CGSize(width: 64, height: 64)
            }
        }
        
    }
    
    override func layoutSubviews() {
        friendsImageView.isUserInteractionEnabled = true
        friendsImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapOnPhotoToAnimate(_:))))
    }
}

