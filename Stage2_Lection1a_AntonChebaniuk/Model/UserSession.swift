//
//  UserSession.swift
//  Stage2_Lection1a_AntonChebaniuk
//
//  Created by Anton Chebaniuk on 09.02.2021.
//

import UIKit

class UserSession {
    
    private init(){}
    static let instance = UserSession()
    
    var name = String()
    var id = Int()
    var token = String()
}
