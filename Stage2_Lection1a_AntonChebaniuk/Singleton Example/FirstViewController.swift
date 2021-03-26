//
//  FirstViewController.swift
//  Stage2_Lection1a_AntonChebaniuk
//
//  Created by Anton Chebaniuk on 08.02.2021.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let session = Session.instance
        session.fio = "Conrad Phillip Heart"
        session.id = 123
        session.money = 1000000000
    }

}
