//
//  FriendsDecodingVK.swift
//  Stage2_Lection1a_AntonChebaniuk
//
//  Created by Anton Chebaniuk on 25.02.2021.
//

import Foundation
import RealmSwift

class FriendsResponse: Decodable {
    let response: Items
}

class Items: Decodable {
    var items: [UserData] = []
}

class UserData: Object, Decodable, Comparable {
    static func < (lhs: UserData, rhs: UserData) -> Bool {
        return
        lhs.first_name != rhs.first_name &&
        lhs.last_name != rhs.last_name &&
        lhs.nickname != rhs.nickname 
    }
    
    @objc dynamic var first_name: String = ""
    @objc dynamic var last_name: String = ""
    @objc dynamic var nickname: String = ""
}

