//
//  NewsTableViewCell.swift
//  Stage2_Lection1a_AntonChebaniuk
//
//  Created by Anton Chebaniuk on 24.01.2021.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var publishedDate: UILabel!
    @IBOutlet weak var newsContext: UITextView!
    @IBOutlet weak var mainImage: UIImageView!
    
    static let nib = UINib(nibName: "NewsTableViewCell", bundle: nil)
    static let identifier = "news"
    
    func configureAvatar(photo: String) {
        avatar.image = UIImage(named: photo)
    }
    
    func configureName(name: String) {
        userName.text = name
    }
    
    func configureDate(date: String) {
        publishedDate.text = date
    }
    
    func configureArticle(article: String) {
        newsContext.text = article
    }
    
    func configureImage(image: String) {
        mainImage.image = UIImage(named: image)
    }
    
    func configureControls(controls: UIView) {
        
    }
    

}
