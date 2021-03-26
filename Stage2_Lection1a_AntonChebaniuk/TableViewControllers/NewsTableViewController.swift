//
//  NewsTableViewController.swift
//  Stage2_Lection1a_AntonChebaniuk
//
//  Created by Anton Chebaniuk on 22.01.2021.
//

import UIKit

class NewsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(NewsTableViewCell.nib, forCellReuseIdentifier: NewsTableViewCell.identifier)
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return newsHeader.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath) as? NewsTableViewCell {
            cell.configureAvatar(photo: newsHeader[indexPath.row].avatar)
            cell.configureName(name: newsHeader[indexPath.row].userName)
            cell.configureDate(date: newsHeader[indexPath.row].publicationDate)
            cell.configureArticle(article: newsContext[indexPath.row].article)
            cell.configureImage(image: newsContext[indexPath.row].mainImage)
            
            return cell
        }

        return UITableViewCell()
    }
    
}
