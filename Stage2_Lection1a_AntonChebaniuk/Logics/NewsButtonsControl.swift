//
//  NewsButtonsControl.swift
//  Stage2_Lection1a_AntonChebaniuk
//
//  Created by Anton Chebaniuk on 25.01.2021.
//

import UIKit

class NewsButtonsControl: UIControl {

    private var comment = UIButton(type: .system)
    private var share = UIButton(type: .system)
    private var container: UIStackView!
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupNewsButtonsUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupNewsButtonsUI()
    }
    
    private func setupNewsButtonsUI() {
        comment.setImage(UIImage(systemName: "quote.bubble"), for: .normal)
        comment.setTitleColor(.blue, for: .normal)
        comment.addTarget(self, action: #selector(commentPost), for: .touchUpInside)
        
        share.setImage(UIImage(systemName: "arrowshape.turn.up.forward"), for: .normal)
        share.setTitleColor(.blue, for: .normal)
        
        
        container = UIStackView(arrangedSubviews: [comment, share])
        addSubview(container)

        container.spacing = 2
        container.axis = .horizontal
        container.alignment = .center
        container.distribution = .equalSpacing
    }
    
    @objc func commentPost(_ sender: UIButton) {
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        container.frame = bounds
    }

}
