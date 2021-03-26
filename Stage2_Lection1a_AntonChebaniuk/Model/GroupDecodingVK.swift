//
//  GroupDecodingVK.swift
//  Stage2_Lection1a_AntonChebaniuk
//
//  Created by Anton Chebaniuk on 25.02.2021.
//

import Foundation
import RealmSwift

//class GroupsResponse: Decodable {
//    let response: Items1
//}
//
//class Items1: Decodable {
//    var items: [Groups] = []
//}
//
//class Groups: Object, Decodable {
//    @objc dynamic var id: Int = 0
//    @objc dynamic var name: String = ""
//    @objc dynamic var type: String = ""
//    @objc dynamic var photo_50: String = ""
//    @objc dynamic var photo_100: String = ""
//    @objc dynamic var photo_200: String = ""
//}


struct GroupsResponse: Decodable {

    let response: Items

    struct Items: Decodable {

        let items: [Group]
    }

    struct Group: Decodable {
        let id: Int
        let name: String
        let type: String
        let photo_50: URL
        let photo_100: URL
        let photo_200: URL
    }
}
