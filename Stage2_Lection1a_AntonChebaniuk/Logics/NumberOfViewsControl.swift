//
//  NumberOfViewsControl.swift
//  Stage2_Lection1a_AntonChebaniuk
//
//  Created by Anton Chebaniuk on 25.01.2021.
//

import UIKit

class NumberOfViewsControl: UIControl {

    private var icon = UIImageView()
    private var counter = UILabel()
    private var container: UIStackView!
    
    var numberOfViewsCounter: Int = 3423
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupNumberOfViewsUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupNumberOfViewsUI()
    }
    
    private func setupNumberOfViewsUI() {
        icon.image = UIImage(systemName: "eye")
        icon.tintColor = UIColor.lightGray
        counter.text = String(numberOfViewsCounter)
        counter.textColor = UIColor.lightGray
        
        container = UIStackView(arrangedSubviews: [icon, counter])
        addSubview(container)
        
        container.spacing = 2
        container.axis = .horizontal
        container.alignment = .center
        container.distribution = .equalSpacing
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        container.frame = bounds
    }

}
