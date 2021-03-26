//
//  BigImageView.swift
//  Stage2_Lection1a_AntonChebaniuk
//
//  Created by Anton Chebaniuk on 24.01.2021.
//

import UIKit

class BigImageView: UIImageView {

    override func layoutSubviews() {
        layer.cornerRadius = layer.frame.width / 50
    }
    
}
