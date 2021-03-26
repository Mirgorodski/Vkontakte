//
//  FriendsViewController.swift
//  Stage2_Lection1a_AntonChebaniuk
//
//  Created by Anton Chebaniuk on 26.01.2021.
//

import UIKit
import RealmSwift

class FriendsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var tempArr: [User] = []
    
    var photo: UIImage?
    var name: String?
    var sections: [String] = []
    var sectionDict: [String: [User]] = [:]
    
    var savedFriendsArray = [UserData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        retreiveData()
        
        
//        print(sortedUsers.count)
        
//        print(sections)
        
    }
    
    func retreiveData() {
        var users = [User]()
        do {
            let realm = try Realm()
            let friends = realm.objects(UserData.self)
            friends.forEach { (userData) in
                let user = User(name: "\(userData.first_name) \(userData.last_name)", photo: "fem1", id: 1)
                users.append(user)
            }
            sortData(sortedUsers: users)
            tableView.reloadData()
        } catch {
            print(error)
        }
    }
    
    func sortData(sortedUsers: [User]) {
        for i in 0..<sortedUsers.count {
            let char = sortedUsers[i].name.prefix(1)
            if sections.contains(String(char)) { continue }
            sections.append(String(char))
        }
        
        for i in 0..<sortedUsers.count {
            let char = sortedUsers[i].name.prefix(1)
            if sectionDict[String(char)] != nil {
                sectionDict[String(char)]?.append(sortedUsers[i])
            } else {
                sectionDict[String(char)] = [sortedUsers[i]]
            }
            
//            if sections.contains(String(char)) { continue }
//            sections.append(String(char))
        }
        
        tempArr = sortedUsers
    }

}



extension FriendsViewController: UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    
    // Row Height -----------------------------------------------------------------------------------------------------------
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 80
        }
    
    
    // Number of Sections ---------------------------------------------------------------------------------------------------
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    
    // Header Titles (Not needed if registered custom header) ----------------------------------------------------------------
    
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return sections[section]
//    }

    
    // Custom Header Declaration ---------------------------------------------------------------------------------------------
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()

        let label = UILabel()
        label.textColor = .black
        label.text = sections[section]

        header.addSubview(label)
        header.backgroundColor = .white
        header.alpha = 0.9
        label.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            label.leftAnchor.constraint(equalTo: header.leftAnchor),
            label.centerYAnchor.constraint(equalTo: header.centerYAnchor)
        ])


        return header
    }
    
    
    // Number of Rows in Sections ----------------------------------------------------------------------------------------------
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var indexArray: [User] = []

        for user in tempArr {
            if user.name.prefix(1) == sections[section] {
                indexArray.append(user)
//                print(user.name)
            }
        }

//        print(indexArray.count)
        return indexArray.count
    }
    
    
    // Cell Declaration ---------------------------------------------------------------------------------------------------------
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? FriendsTableViewCell {
            
            
            var indexArray: [User] = []


            for user in tempArr {
                if user.name.prefix(1) == sections[indexPath.section] {
                    indexArray.append(user)
                }
            }

            tempArr.append(contentsOf: indexArray)
            
            cell.friendsLabel.text = indexArray[indexPath.row].name
            cell.friendsImageView.image = UIImage(named: indexArray[indexPath.row].photo)
//
            return cell
            
        }

        return UITableViewCell()
    }
    
    
    // Clicked Row in Table ----------------------------------------------------------------------------------------------------
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        photo = UIImage(named: (sectionDict[sections[indexPath.section]]?[indexPath.row].photo)!) ?? nil
        name = sectionDict[sections[indexPath.section]]![indexPath.row].name
        performSegue(withIdentifier: "show_details", sender: self)
        print(tempArr)
    }

    
    // Prepare for Segue --------------------------------------------------------------------------------------------------------
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as? PersonalPageCollectionViewController
        destinationViewController?.personalPhoto = photo
        destinationViewController?.friendName = name
    }
    
    
    // Search Bar ---------------------------------------------------------------------------------------------------------------
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        print(sections)
        
        var searchedArray: [User] = []
        tempArr = []
        
        if searchText.count == 0 {
            tempArr = sortedUsers
        }
        
        for i in 0..<sortedUsers.count {
            if sortedUsers[i].name.contains(searchText) {
                print(sortedUsers[i])
                searchedArray.append(sortedUsers[i])
                
                let char = sortedUsers[i].name.prefix(1)
                if sections.contains(String(char)) { continue }
                sections.append(String(char))

                print(searchText)
                print(sections)
                }
            }
        tempArr = searchedArray
        
//        sections = temp
        
        tableView.reloadData()
    }
    
}
