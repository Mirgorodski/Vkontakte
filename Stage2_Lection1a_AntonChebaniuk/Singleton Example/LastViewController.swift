//
//  LastViewController.swift
//  Stage2_Lection1a_AntonChebaniuk
//
//  Created by Anton Chebaniuk on 08.02.2021.
//

import UIKit

class LastViewController: UIViewController {

    @IBOutlet weak var nameView: UILabel!
    @IBOutlet weak var moneyView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let session = Session.instance
        nameView.text = session.fio
        moneyView.text = String(session.money)
    }
    
}
