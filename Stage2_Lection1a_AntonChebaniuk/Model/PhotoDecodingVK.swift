//
//  PhotoDecodingVK.swift
//  Stage2_Lection1a_AntonChebaniuk
//
//  Created by Anton Chebaniuk on 25.02.2021.
//

import Foundation
import RealmSwift

class PhotoResponse: Decodable {
    let response: Items2
}

class Items2: Decodable {
    var items: [Photos] = []
}

class Photos: Decodable {
    var sizes: [Sizes] = []
}

class Sizes: Object, Decodable {
    @objc dynamic var height: Int = 0
    @objc dynamic var url: String
}


//
//class PhotoResponse: Decodable {
//    let response: Items2
//}
//
//class Items2: Decodable {
//    var items: [Photos] = []
//}
//
//class Photos: Object, Decodable {
//    @objc dynamic var user_id: Int
//}


//class PhotoResponse: Decodable {
//    let response: Items2
//}
//
//class Items2: Decodable {
//    var items: [Photos] = []
//}
//
//class Photos: Decodable {
//    var sizes: [Sizes] = []
//}
//
//class Sizes: Object, Decodable {
//    @objc dynamic var height: Int = 0
//    @objc dynamic var url: String
//}













//struct DataResponse: Decodable {
//    let response: Items
//
//    struct Items: Decodable {
//        let items: [Photos]
//
//        struct Photos: Decodable {
//            let sizes: [Sizes]
//
//            struct Sizes: Decodable {
//                let height: Int
//                let url: URL
//            }
//        }
//    }
//}
