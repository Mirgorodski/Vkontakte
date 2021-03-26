//
//  VKSession.swift
//  Stage2_Lection1a_AntonChebaniuk
//
//  Created by Anton Chebaniuk on 16.02.2021.
//

import Foundation

class VKSession {
    static let shared = VKSession()
    
    var token = ""
    var userId = Int()
    
    private init() {}
    
}
