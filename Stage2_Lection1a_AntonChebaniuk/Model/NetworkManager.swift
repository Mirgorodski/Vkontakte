//
//  NetworkManager.swift
//  Stage2_Lection1a_AntonChebaniuk
//
//  Created by Anton Chebaniuk on 18.02.2021.
//

import UIKit
import RealmSwift

class NetworkManager {
    
    
    
    let decoder = JSONDecoder()
    
    static let shared = NetworkManager()
    
    
    func loadGroups(completion: @escaping (Result<GroupsResponse, Error>) -> Void) {
        
        var compomemts = URLComponents()
        compomemts.scheme = "https"
        compomemts.host = "api.vk.com"
        compomemts.path = "/method/groups.get"
        compomemts.queryItems = [
            URLQueryItem(name: "access_token", value: VKSession.shared.token),
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "v", value: "5.92")
        ]
        
        let URL = compomemts.url
        
        guard let url = URL else { return }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, _, _) in
            
            if let data = data {
//                print(String(bytes: data, encoding: .utf8))
                do {
                    let groups = try self.decoder.decode(GroupsResponse.self, from: data)
                    completion(.success(groups))
//                    groups.response.items.forEach( {
//
//                        print("Group name: \($0)\nGroup ID: \($0.id),\nURL for size 200: \n\($0.photo_200)")
//
//                    })
                } catch {
                    completion(.failure(error))
                    print(error)
                }
            }
            
        }.resume()
    }
    
    func loadPhotos() {
        
        var compomemts = URLComponents()
        compomemts.scheme = "https"
        compomemts.host = "api.vk.com"
        compomemts.path = "/method/photos.get"
        compomemts.queryItems = [
            URLQueryItem(name: "access_token", value: VKSession.shared.token),
            URLQueryItem(name: "owner_id", value: "-639703020"),
            URLQueryItem(name: "album_id", value: "profile"),
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "v", value: "5.92")
        ]
        
        let URL = compomemts.url
        
        guard let url = URL else { return }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, _, _) in
            
            if let data = data {
                do {
                    let photos = try self.decoder.decode(PhotoResponse.self, from: data)
                    photos.response.items.forEach({
                        for element in $0.sizes {
                            print("Height: \(element.height), \nURL: \(element.url)")
                        }
                        
                    })
//                    print(photos)
                } catch {
                    print(error)
                }
            }
            
        }.resume()
    }
    
    func loadFriends() {
        var compomemts = URLComponents()
        compomemts.scheme = "https"
        compomemts.host = "api.vk.com"
        compomemts.path = "/method/friends.get"
        compomemts.queryItems = [
            URLQueryItem(name: "access_token", value: VKSession.shared.token),
            URLQueryItem(name: "order", value: "name"),
            URLQueryItem(name: "fields", value: "nickname"),
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "v", value: "5.92")
        ]
        
        let URL = compomemts.url
        guard let url = URL else { return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, _, _) in
            
            var friendsArray = [UserData]()
            
            if let data = data {
//                print(String(bytes: data, encoding: .utf8))
                do {
//                    print(data)
                    let friends = try self.decoder.decode(FriendsResponse.self, from: data)
                    friends.response.items.forEach( {

                        print("First name: \($0.first_name) \nLast name: \($0.last_name) \nNickname: \($0.nickname)")
                        let friend = UserData()
                        friend.first_name = $0.first_name
                        friend.last_name = $0.last_name
                        friend.nickname = $0.nickname
                        
                        friendsArray.append(friend)

                    })
                    self.saveUserData(friendsArray)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    func saveUserData(_ userData: [UserData]) {
        do {
            let array = [UserData]()
            let realm = try Realm()
//            let friends = realm.objects(UserData.self)
//            print(friends)
            try! realm.write {
                let friends = Array(realm.objects(UserData.self))
                guard friends != userData else { return }
                realm.add(userData)
                print(userData)
            }
        } catch {
            print(error)
        }
    }
    
}

extension UIImageView {
    func laodImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            print(url, data)
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }.resume()
    }
}
